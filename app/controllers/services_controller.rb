class ServicesController < ApplicationController
	skip_before_action :authorize_request, only: [:create,:show,:index]
	def index #controlado por el GET
	    @service = Service.all
	    render json: @service, status: :ok
	end
	def show
	  @service = Service.find(params[:id])
	  json_response({"Service": @service})
	end
	def create
		item = Service.create!(service_params)
	    render json: item, status: :ok
	end

	private

	def service_params
	  params.permit(
	    :name,
	    :description
	  )
	end
end
