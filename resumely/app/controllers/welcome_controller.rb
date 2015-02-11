class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def dashboard

    @users = User.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@current_user.full_name.parameterize}-resume.pdf",
               disposition: 'attachment'
      end
    end

  end
end
