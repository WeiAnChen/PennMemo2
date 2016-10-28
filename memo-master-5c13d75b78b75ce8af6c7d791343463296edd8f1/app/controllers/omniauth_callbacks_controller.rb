class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    # raise user.attributes.to_s
    # raise user.errors.messages.to_s
    if user.persisted?
      session[:user_id] = user.id
      redirect_to nursing_activities_path, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def login
  end

  def signout
   session[:user_id] = nil # logs out the user
   cookies.delete '_project_session' #in case any info stored in cookie
   redirect_to root_url
 end
  alias_method :mhealth, :all
end
