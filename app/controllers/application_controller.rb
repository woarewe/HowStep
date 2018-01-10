class ApplicationController < ActionController::Base
  load_and_authorize_resource unless: :devise_controller?, except: [:show, :index]
  before_action :set_locale
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
  rescue_from ActionView::MissingTemplate, with: :redirector_to_root_path
  rescue_from ActiveRecord::RecordNotFound, with: :redirector_to_root_path

  def redirector_to_root_path
    redirect_to root_path
  end
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
