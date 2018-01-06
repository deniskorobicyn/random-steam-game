class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def result(object, options = {})
    render({json: object}.merge!(options))
  end

  def not_found(message = I18n.t('api.errors.not_found'))
    render_error(404, message)
  end

  def bad_request(message = I18n.t('api.errors.bad_request'))
    render_error(400, message)
  end

  def render_error(status, message)
    render(json: {error: message}, status: status)
  end
end
