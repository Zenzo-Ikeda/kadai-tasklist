class ApplicationController < ActionController::Base

include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
      return 
    end
  end

end
