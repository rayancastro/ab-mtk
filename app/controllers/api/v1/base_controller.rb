class Api::V1::BaseController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from StandardError, with: :error_response
  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def error_response(exception)
    render json: { error: exception.message }, status: 500
  end
end
