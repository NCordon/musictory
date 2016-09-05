class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::StatementInvalid, :with => :trigger_error_handler

  def trigger_error_handler(exception)

  end
end
