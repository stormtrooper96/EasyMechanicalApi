include Response
include ExceptionHandler
class Applicationcontroller2Controller < ActionController::API
	  before_action :authorize_request_operator
	  attr_reader :current_operator
	  private
	  def authorize_request_operator
	    @current_operator = (AuthorizeApiRequestOperator.new(request.headers).call)[:operator]
	    render json: { error: 'Not Authorized' }, status: 401 unless @current_operator
	  end
end
