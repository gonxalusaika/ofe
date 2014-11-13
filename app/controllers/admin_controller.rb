class AdminController < ApplicationController
	include ApplicationHelper
  before_filter :authenticate

  def index
  end
end
