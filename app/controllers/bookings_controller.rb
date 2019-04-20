class BookingsController < Applicationcontroller2Controller
	skip_before_action :authorize_request_operator, only: [:create,:update]
  def index #controlado por el GET
      @bookings = Booking.all
      render json: @bookings, status: :ok
  end
  def show
    @booking = Booking.find(params[:id])
    json_response({"Booking": @booking})
  end

  def create
	    item = Booking.create!(booking_params)
	    render json: item, status: :ok
  end
  def update
  	bookingu = Booking.find(params[:id])
  	Booking.update(booking_params)
  	response={message: Message.update_customer,id: bookingu}
  	render json: response, status: :ok

  end
  private

  def booking_params
    params.permit(	
   	  :accepted_at,
      :cancelled_at,
      :finish_at,
      :rate,
      :comment_rate,
      :booking_status_id,
      :service_id,
      :user_id,
      :operator_id
      	

    )
  end	

end
