class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  private

  def render_not_found error
    render json: {error: {error.model => "Not Found"}}, status: :not_found
    # render json: { error: "#{object.model} not found"}, status: 404
  end

  def render_unprocessable_entity invalid
      # render json: {errors: invalid.record.errors}, status: :unprocessable_entity
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity

  end


end
