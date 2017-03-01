class ApplicationController < ActionController::Base
  include DateHelper
  protect_from_forgery with: :exception
end
