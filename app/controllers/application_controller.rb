class ApplicationController < ActionController::Base
  add_flash_types :form_error
  protect_from_forgery with: :exception

end
