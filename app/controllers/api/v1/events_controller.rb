class Api::V1::EventsController < ApplicationController

  def create
    @event = Event.new(event_params)

		if @event.save
			render json: @event
		else
			render json: {errors: @event.errors.full_messages}
		end
  end

  def update
    @event = find_event

    @event.update(event_params)
    if @event.save
      render json: @event, status: :accepted
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    Event.destroy(params[:id])
		render json: { success: "You successefully removed your organizations event."}
	end

  private 

  def event_params
    params.require(:event).permit(:organization_id,:name,:description,:complete,:img_url)
  end
 
  def find_event
    @event = Event.find(params[:id])
  end
end
