class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update ]
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Just begin to cut your cord, #{@user.username}!"
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end
 
  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end
  
  def update 
    if @user.update(user_params)
      flash[:success] = "Your account was update successfully."
      redirect_to user_path(session[:user_id])
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
    @user = User.find(session[:user_id])
  end

end
