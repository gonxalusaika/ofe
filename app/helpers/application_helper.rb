module ApplicationHelper
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        User.authenticate(username, password)
      end
    end
end
