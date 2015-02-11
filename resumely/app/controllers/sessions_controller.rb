class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]

    # find the user
    # if validate the password
    #   1) set session[:user_id]  << this actually "signs" them in
    #   2) redirect back
    # else
    #    show new form again

    user = User.find_by email: email
    if user.try(:authenticate, password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    session[:new_user_id] = nil
    redirect_to root_path
  end
end
