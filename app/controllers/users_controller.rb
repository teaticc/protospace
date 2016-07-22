class UsersController < ApplicationController
  before_action :set_user

  def show
    # eager_load効いてない(captured_imagesにもやると逆に遅くなる)
    @prototypes = @user.prototypes.eager_load(:user).page(params[:page]).order(id: :desc)
  end

  def edit
  end

  def update
    @user.update_attributes(name: user_params[:name], email: user_params[:email], member:user_params[:member], profile: user_params[:profile], avatar: user_params[:avatar], works: user_params[:works])
    redirect_to :root, notice: "successfully updated!"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,:member, :profile, :avatar, :works)
  end
end
