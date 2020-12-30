# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from(ActiveRecord::RecordNotFound, with: :render_not_found)
  rescue_from(ActiveRecord::RecordInvalid, with: :render_unprocessable_entity)
  rescue_from(ActionController::ParameterMissing, with: :render_bad_request)

  private

  def render_not_found(_)
    head :not_found
  end

  def render_bad_request(_)
    head :bad_request
  end

  def render_unprocessable_entity(_)
    head :unprocessable_entity
  end
end
