class ApplicationController < ActionController::Base
  include GitHub
  protect_from_forgery
end
