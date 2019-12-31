class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    new_address_path
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end