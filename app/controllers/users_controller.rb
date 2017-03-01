class UsersController < ApplicationController
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
      @user = User.find(params[:id])
    end


    private
    def user_params
      params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
    end


end
