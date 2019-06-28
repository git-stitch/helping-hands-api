class Api::V1::OrganizationContactController < ApplicationController
  def create
    @organization_contact = OrganizationContact.new(organization_contact_params)

		if @organization_contact.save
			render json: @organization_contact
		else
			render json: {errors: @organization_contact.errors.full_messages}
		end
  end

  def update
    @organization_contact = find_organization_contact

    @organization_contact.update(organization_contact_params)
    if @organization_contact.save
      render json: @organization_contact, status: :accepted
    else
      render json: { errors: @organization_contact.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    OrganizationContact.destroy(params[:id])
		render json: { success: "You successefully removed your organizations contact media."}
	end

  private 

  def organization_contact_params
    params.require(:organization_contact).permit(:organiztion_id,:phone, :email)
  end
 
  def find_organization_contact
    @organization_contact = OrganizationContact.find(params[:id])
  end


end
