class ApplicationController < ActionController::Base
  layout :layout
  before_action :set_categories

  private
  def layout
    if devise_controller? && resource_name == :user && action_name == "edit"
      "application"
    elsif !devise_controller?
      "application"
    else 
      "devise"
    end
  end

  def set_categories
    if user_signed_in?
      @categories = Category.all.where(user_id: current_user.id)
    else 
      @categories = Category.all
    end
  end

  protected

  def after_sign_up_path_for(resource)
    tasks_path
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
