class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    check_update( @user)
    render 'edit'
  end

  def destroy
    @user.destroy
    flash[:notice] = t('controllers.users.destroy.notice')
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def check_update user
    if user.update_attributes(user_params)
      flash.now[:notice] = t('controllers.users.update.notice')
    else
      flash.now[:alert] = t('controllers.users.update.alert')
    end
  end

  def check_user_rights(action)
    unless can? action, @user
      flash['alert'] = t('controllers.cancan.alert')
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end