class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = find_user
    render json: @user, status: :accepted
  end

  def create
		@user = User.new(user_params)

		if @user.save
			token = encode_token(@user.id)

			render json: {user: UserSerializer.new(@user), token: token}
		else
			render json: {errors: @user.errors.full_messages}
		end
	end

  def update
    @user = find_user

    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    User.destroy(params[:id])
		render json: { success: "You successefully destroyed your account."}
  end
  
  def donate
    payment = StripePayment.new 
    @user = User.find_by(id:user_params[:id])
    @organization = Organization.find_by(id:user_params[:organization_id])
    amount = user_params[:amount].to_i * 100
    # byebug
    @info = {amount: amount, organization_name: user_params[:organization_name]}
    response = payment.make_payment(@info, user_params[:token_id])
    Donation.create(user_id:@user.id, organization_id:@organization.id,charge_id:response.id)

    supporters_arr = @organization.supporters.find do |s| 
      s.user_id === @user.id
    end
    if supporters_arr != nil
      return render json: {receipt: response.receipt_url}
    end

    Supporter.create(user_id:@user.id, organization_id:@organization.id)
    byebug
    render json: {receipt: response.receipt_url}
  end
 
  private
 
  def user_params
    params.require(:user).permit(:id,:email, :password, :organization_id, :token_id, :amount, :organization_name)
  end
 
  def find_user
    @user = User.find([:id])
  end
end
