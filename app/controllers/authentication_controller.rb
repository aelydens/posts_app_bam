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
      flash[:notice] = "Oops something went wrong"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You've been signed out"
    redirect_to root_path
  end
end
