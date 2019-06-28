class Api::V1::OrganizationsController < ApplicationController
  def index 
    @organizations = Organization.all 
    render json: @organizations
  end

  def show 
    @organization = find_organization

    if @organization
      render json: @organization, status: :accepted 
    else
      render json: { errors: "No such cause found." }, status: :unprocessible_entity
    end
  end

  def create
    @organization = Organization.new(organization_params)

		if @organization.save
			render json: @organization
		else
			render json: {errors: @organization.errors.full_messages}
		end
  end

  def update
    @organization = find_organization
    
    @organization.update(organization_params)
    if @organization.save
      render json: @organization, status: :accepted
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    Organization.destroy(params[:id])
		render json: { success: "You successefully removed your organization."}
	end

  private 

  def organization_params
    params.require(:organization).permit(:name,:logo_url,:bio,:mission_statement,:homepage_url,:address)
  end
 
  def find_organization
    @organization = Organization.find(params[:id])
  end
end
