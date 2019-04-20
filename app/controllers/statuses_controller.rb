class StatusesController < ApplicationController
	skip_before_action :authorize_request, only: [:create,:show,:index]
	def index #controlado por el GET
	    @status = Status.all
	    render json: @status, status: :ok
	end
	def show
	  @status = Status.find(params[:id])
	  json_response({"status": @status})
	end
	def create
		item = Status.create!(status_params)
	    render json: item, status: :ok
	end

	private

	def status_params
	  params.permit(
	    :name,
	    :description
	  )
	end


end
