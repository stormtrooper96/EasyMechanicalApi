# app/auth/authenticate_user.rb
class AuthenticateOperator
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(operator_id: operator.id) if operator
    end
  
    private
  
    attr_reader :email, :password
  
    # verify user credentials
    def operator
      operator = Operator.find_by(email: email)
      return operator if operator && operator.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
  