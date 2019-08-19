class Admin::Base < ApplicationController
  before_action :admin_login_required
  private def admin_login_required
    raise Forbidden unless current_member&.admin?
  end
end