class UsersController < ApplicationController
  before_action :prevent_logged_in_user_access
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @links = @user.links
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_path, notice: 'Logged in'
    else
      render :new 
    end 
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out'
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
