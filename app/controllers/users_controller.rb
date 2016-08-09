class UsersController < ApplicationController
  include Common
  before_action :return_sign_out_user, only: [:edit, :update]
  before_action :set_user
  before_action :return_other_users, only: [:edit, :update]

  def show
    # eager_load効いてない(captured_imagesにもやると逆に遅くなる)
    @prototypes = @user.prototypes.eager_load(:user).page(params[:page]).order(id: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      bypass_sign_in @user
      redirect_to root_path, notice: "successfully updated!"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.includes(prototypes: :tags).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :member, :profile, :avatar, :works)
  end

  def return_other_users
    redirect_to root_path unless @user.id == current_user.id
  end

end
