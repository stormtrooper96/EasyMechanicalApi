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




  def showRidesByRating
    @operator = Operator.find(showBookingsAllow[:id])
    bookingsactive = []
    diff2=0

    Booking.all.each do |booking|
       
     diff =(Time.current()  - booking.created_at) / 60

     if diff >=2 and booking.booking_status_id==0
       booking.booking_status_id=3 
   
     elsif @operator.rate>=4.5 and booking.booking_status_id==0
       bookingsactive.push(booking)
    
     elsif @operator.rate<4.5 and  @operator.rate>4.0 and diff<1 and diff >0.10  and booking.booking_status_id==0
           bookingsactive.push(booking)
   
     elsif @operator.rate<4.0 and  @operator.rate>3.5 and diff>=1 and diff <2 and booking.booking_status_id==0
      bookingsactive.push(booking)
     
     end
     diff2=diff
      
    end
    render :json => bookingsactive, status: :ok
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
  def showBookingsAllow
    params.permit(  
      :id
    )
  end 

end
