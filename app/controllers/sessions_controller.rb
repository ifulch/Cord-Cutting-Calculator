class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:success] = "You have successfully logged in."
      # redirect_to root_path
      redirect_to user_path(session[:user_id])
      flash[:success] = "You have successfully logged in."
    else
      flash.now[:danger] = "Please enter the correct imformation!"
      render 'new'
    end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "You have logged out."
  	redirect_to root_path
  end

end
