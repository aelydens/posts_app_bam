class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing in!"
      redirect_to root_path
    else
      render :new
    end
  end

end
