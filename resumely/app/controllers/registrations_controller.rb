class RegistrationsController < ApplicationController
  include Wicked::Wizard

  steps :login, :personal, :social, :last_job

  def show


    if session[:new_user_id].blank?
      @user = User.create!
      session[:new_user_id] = @user.id
    end
    @user = User.find session[:new_user_id]

    render_wizard
  end

  def update
    @user = User.find session[:new_user_id]


    @user.update_attribute(:status, step.to_s)
    if step == steps.last
      @user.update_attribute(:status, 'active')
    end

    case step
    when :login
      @user.update(params.require(:user).permit(:email, :password, :password_confirmation))
    when :personal
      @user.update(params.require(:user).permit(:first_name, :last_name, :title, :bio))
    when :social
      @user.update(params.require(:user).permit(:twitter, :facebook))
    when :last_job
      @user.update(params.require(:user).permit(:last_job_title, :last_job_description))
      # signs in the user
      session[:user_id] = @user.id
    end

    render_wizard @user
  end

end
