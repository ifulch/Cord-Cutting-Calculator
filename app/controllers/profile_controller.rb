class ProfileController < ApplicationController
    before_action :require_user
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def show
        @user = User.find(session[:user_id])
    end

    def edit
      @user = User.find(session[:user_id])
    end

    def update
      @user = User.find(session[:user_id])
      @user.update_attributes!(movie_params)
      flash[:notice] = "Update success"
      redirect_to show_profile(@user)
    end
end
