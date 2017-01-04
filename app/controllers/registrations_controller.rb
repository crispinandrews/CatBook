class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :petname, :password, :password_confirmation, :image)
  end

  def account_update_params
    params.require(:user).permit(:email, :petname, :password, :password_confirmation, :current_password, :image)
  end
end
