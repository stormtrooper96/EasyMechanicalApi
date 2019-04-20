class BookingStatusesController < ApplicationController
	skip_before_action :authorize_request, only: [:create,:show,:index]
	def index #controlado por el GET
	    @bookingsStatus = BookingStatus.all
	    render json: @bookingsStatus, status: :ok
	end
	def show
	  @statusb = BookingStatus.find(params[:id])
	  json_response({"booking_status": @statusb})
	end

	  def create
	    item = BookingStatus.create!(statusb_params)
	    render json: item, status: :ok
	end

	private

	def statusb_params
	  params.permit(
	    :name,
	    :description
	  )
	end
end
