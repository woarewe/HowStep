class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    check_user_rights :edit, @user
  end

  def update
    @user = User.find(params[:id])
    check_update( @user)
    render 'edit'
  end

  def destroy
    User.find(params[:id]).destroy
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

  def check_user_rights(action, model)
    unless can? action, model
      flash['alert'] = t('controllers.cancan.alert')
      redirect_to root_path
    end
  end

end