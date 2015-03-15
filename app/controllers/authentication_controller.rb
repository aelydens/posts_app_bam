class AuthenticationController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thanks for signing in!"
      redirect_to root_path
    else
      render :new
    end
  end
end
