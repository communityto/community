class UsersController < ApplicationController
before_action :require_login
  def new
      @user = User.new
      @user.avatar = params[:file]
    end

    def create
      @user = User.new(user_params)
      if @user.save
        auto_login(@user)
        redirect_to root_path
      else
        render 'new'
      end
    end

    def show

      @user = current_user

    end


    private
    def user_params
      params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
    end


end
