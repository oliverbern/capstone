
class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :title, :company, :street_and_no, :zip, :town, :country, :phone, :website, :vat)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :title, :company, :street_and_no, :zip, :town, :country, :phone, :website, :vat)
  end
end


