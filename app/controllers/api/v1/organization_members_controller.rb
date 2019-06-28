class Api::V1::OrganizationMembersController < ApplicationController
  def index
    @organization_members = OrganizationMember.all 
    render json: @organization_members
  end

  def show
    @organization_members = find_organization_members
    render json: @organization_members, status: :accepted
  end

  def create
    @organization_members = OrganizationMember.new(organization_members_params)
  
		if @organization_members.save
      @organization = @organization_members.organization
			token = org_encode_token(@organization_members.id)

			render json: {organization_members: OrganizationMemberSerializer.new(@organization_members), token: token}
		else
			render json: {errors: @organization_members.errors.full_messages}
		end
	end

  def update
    @organization_members = find_organization_members

    @organization_members.update(organization_members_params)
    if @organization_members.save
      render json: @organization_members, status: :accepted
    else
      render json: { errors: @organization_members.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    OrganizationMember.destroy(params[:id])
		render json: { success: "You successefully removed your organizations member."}
	end
 
  private
 
  def organization_members_params
    params.require(:organization_member).permit(:organization_id, :email,:password)
  end
 
  def find_organization_members
    @organization_members = OrganizationMember.find(params[:id])
  end
end
