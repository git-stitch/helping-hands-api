class Api::V1::OrganizationImageController < ApplicationController
  def create
    @organization_image = OrganizationImage.new(organization_image_params)

		if @organization_image.save
			render json: @organization_image
		else
			render json: {errors: @organization_image.errors.full_messages}
		end
  end

  def update
    @organization_image = find_organization_image

    @organization_image.update(organization_image_params)
    if @organization_image.save
      render json: @organization_image, status: :accepted
    else
      render json: { errors: @organization_image.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    OrganizationImage.destroy(params[:id])
		render json: { success: "You successefully removed your organizations image media."}
	end

  private 

  def organization_image_params
    params.require(:organization_image).permit(:organization_id,:img_url)
  end
 
  def find_organization_image
    @organization_image = OrganizationImage.find(params[:id])
  end
end
