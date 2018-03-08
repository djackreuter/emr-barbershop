class ApplicationController < ActionController::Base
  before_action :set_time_zone
  protect_from_forgery with: :exception
  include ApplicationHelper
  def set_time_zone
    Time.zone = 'America/Denver'
  end
end
