class ApplicationController < ActionController::API

  def authorize_request
    header = request.headers['Token']
    @customer = Customer.find_by(access_token: header)
    unless @customer
      render json: { errors: "Invalid access token." }, status: :unauthorized
    end
  end
end
