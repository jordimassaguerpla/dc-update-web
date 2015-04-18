class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize

  def authorize
    # all roles
    return false if params[:controller] == "sessions" && params[:action] == "create"
    return false if params[:controller] == "sessions" && params[:action] == "destroy"
    return false if params[:controller] == "home"     && params[:action] == "index"

      # admin role
    return false if is_admin?

    # user which is not admin role
    if (!current_user.nil?)
      return false if route("docker_images", "index")
      return false if route("docker_images", "show")     && image_in_params_owned_by_current_user
      return false if route("docker_images", "edit")     && image_in_params_owned_by_current_user 
      return false if route("docker_images", "destroy")  && image_in_params_owned_by_current_user 
      return false if route("docker_images", "update")   && image_in_params_owned_by_current_user 
      return false if route("docker_images", "new")
      return false if route("docker_images", "create")

      return false if route("docker_cfgs", "show")       && docker_cfg_in_params_owned_by_current_user
      return false if route("docker_cfgs", "edit")       && docker_cfg_in_params_owned_by_current_user
      return false if route("docker_cfgs", "update")     && docker_cfg_in_params_owned_by_current_user

      return false if route("users", "show")             && params[:id] == current_user.id.to_s
      return false if route("users", "edit")             && params[:id] == current_user.id.to_s
      return false if route("users", "destroy")          && params[:id] == current_user.id.to_s
      return false if route("users", "update")           && params[:id] == current_user.id.to_s
    end

    redirect_to root_url, error: 'Unauthorized access'
  end

  def image_in_params_owned_by_current_user
    DockerImage.find_by_id(params[:id]) && DockerImage.find_by_id(params[:id]).user_id == current_user.id
  end

  def docker_cfg_in_params_owned_by_current_user
    !current_user.docker_cfg_id.nil? && params[:id] == current_user.docker_cfg_id.to_s
  end

  def route(controller, action)
    params[:controller] == controller && params[:action] == action
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    current_user && current_user.admin?
  end

  helper_method :is_admin?
  helper_method :current_user

end
