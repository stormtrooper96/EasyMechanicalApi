class WorkShopsController < Applicationcontroller2Controller
	skip_before_action :authorize_request_operator, only: [:create,:show]
	def index #controlado por el GET
	    @service = WorkShop.all
	    render json: @service, status: :ok
	end
	def show
	  @service = WorkShop.find(params[:id])
	  json_response({"WorkShop": @service})
	end
	def create
		item = WorkShop.create!(workshop_params)
	    render json: item, status: :ok
	end

	private

	def workshop_params
	  params.permit(
	    :name,
	    :ubication,
	    :owner
	  )
	end
end
