class Users::SessionsController < Devise::SessionsController
  layout 'empty'
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   byebug
  #   if resource.is_admin?
  #     set_flash_message!(:notice, :signed_in)
  #     sign_in(resource_name, resource)
  #     yield resource if block_given?
  #     respond_with resource, location: after_sign_in_path_for(resource)
  #   else
  #     set_flash_message!(:warning, :no_admin)
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
