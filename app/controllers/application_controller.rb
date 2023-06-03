# class ApplicationController < ActionController::Base
#     protect_from_forgery with: :exception

#     before_action :configure_permitted_parameters, if: :devise_controller?

#     def sign_out_user
#       sign_out(current_user)
#       redirect_to root_path
#     end

#     protected

#     def configure_permitted_parameters
#       devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:name, :surname, :email, :password)}
#       devise_parameter_sanitizer.permit(:account_update)
# { |user| user.permit(:name, :surname, :email, :password, :current_password)}
#     end
# end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name surname email password current_password])
  end
end
