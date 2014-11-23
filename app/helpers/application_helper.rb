module ApplicationHelper
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    return @current_user
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to login_url
    else
      @current_user = User.find(session[:user_id])
    # authenticate_or_request_with_http_basic do |username, password|
    #   @current_user ||= User.authenticate(username, password)
    #   session[:user_id] = @current_user.id if @current_user
    #   @current_user
    end
  end

  def header_javascript script
    content_for :head do
      javascript_include_tag script
    end
  end
end
