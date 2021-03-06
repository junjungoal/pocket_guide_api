class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include Garage::ControllerHelper

  def current_resource_owner
    @current_resource_owner || Tourist.find(resource_owner_id) if resource_owner_id
  end
end
