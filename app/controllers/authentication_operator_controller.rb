class AuthenticationOperatorController < Applicationcontroller2Controller
	before_action :authorize_request_operator
	skip_before_action :authorize_request_operator, only: :authenticate
	def authenticateOperator
	  auth_token =
	    AuthenticateOperator.new(auth_params[:email], auth_params[:password]).call
	  json_response(auth_token: auth_token)
	end
	private

	def auth_params
	  params.permit(:email, :password)
	end
end
