class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  
  def get_boards
    @all_boards = current_user.boards
  end
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
