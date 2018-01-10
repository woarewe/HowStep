module CanCan
  def check_user_rights
    unless can?
      flash['alert'] = t('controllers.cancan.alert')
      redirect_to root_path
    end
  end
end