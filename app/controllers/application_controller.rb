class ApplicationController < ActionController::API
 before_action :authenticate_request
  attr_reader :current_admin

skip_before_action :authenticate_request, only: [:create]



  private
  def authenticate_request
    @current_admin = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_admin
    
    
  end
end