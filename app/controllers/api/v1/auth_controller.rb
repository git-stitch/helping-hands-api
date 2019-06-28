class Api::V1::AuthController < ApplicationController

  def login
    # check if my params contain the entered username and password
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      token = encode_token(user.id)
      render json: {user: UserSerializer.new(user), token: token}
      # render json: user
    else
      render json: {errors: "There was an error with your credentials."}
    end
  end

  def org_login
    # check if my params contain the entered username and password
    member = OrganizationMember.find_by(email: auth_params[:email])
    @organization = member.organization
    if member && member.authenticate(auth_params[:password])
      token = encode_token(member.id)
      render json: {organization: OrganizationSerializer.new(@organization), token: token}
      # render json: member
    else
      render json: {errors: "Some credentials are incorrect."}
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: {errors: "Get your out the cookie jar!"}
    end
  end

  def org_auto_login
    if org_session_user
      @organization = member.organization
      render json: @organization
    else
      render json: {errors: "Get your out the cookie jar!"}
    end
  end

  private

  def auth_params
    params.require(:user).permit(:email,:password, :organization_id)
  end
end
