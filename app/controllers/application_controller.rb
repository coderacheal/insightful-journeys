# class ApplicationController < ActionController::Base
#   def current_user
#     User.first!
#   end
# end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :bio])
  end
end
