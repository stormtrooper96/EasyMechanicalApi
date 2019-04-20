class OperatorsController < Applicationcontroller2Controller

  # POST /signup
  # return authenticated token upon signup
  skip_before_action :authorize_request_operator, only: :create
  #skip_before_action :authorize_request_operator, only: [:create,:show,:update]

  def index #controlado por el GET
      @operators = Operator.all
      render json: @operators, status: :ok
  end
  def show
    @operator = Operator.find(params[:id])
    json_response({"Operator": @operator}) #objeto dentro de objeto, @user.rol nos permite mostrar la relación con rol
  end

  def create
    operator = Operator.create!(operator_params)
    auth_token = AuthenticateOperator.new(operator.email, operator.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end
  def update
  	operatoru = Operator.find(params[:id])
  	Operator.update(operator_params)
  	response={message: Message.update_customer,id: operatoru.id}
  	render json: response, status: :ok

  end	
  private

  def operator_params
    params.permit(
      :work_shop_id,
      :status_id,
      :name,
      :rate,
      :email,
      :national_id,
      :password,
      :password_confirmation
    )
  end
end



