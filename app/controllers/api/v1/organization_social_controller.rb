class Api::V1::OrganizationSocialController < ApplicationController
  
  def create
    @organization_social = OrganizationSocial.new(organization_social_params)

		if @organization_social.save
			render json: @organization_social
		else
			render json: {errors: @organization_social.errors.full_messages}
		end
  end

  def update
    @organization_social = find_organization_social

    @organization_social.update(organization_social_params)
    if @organization_social.save
      render json: @organization_social, status: :accepted
    else
      render json: { errors: @organization_social.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    OrganizationSocial.destroy(params[:id])
		render json: { success: "You successefully removed your organizations social media."}
	end

  private 

  def organization_social_params
    params.require(:organization_social).permit(:organization_id,:social_media_name,:url)
  end
 
  def find_organization_social
    @organization_social = OrganizationSocial.find(params[:id])
  end
end
