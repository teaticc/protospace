class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(name: user_params[:name], email: user_params[:email], member:user_params[:member], profile: user_params[:profile], avatar: user_params[:avatar], works: user_params[:works])
    redirect_to :root
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:member, :profile, :avatar, :works)
    end
  end

