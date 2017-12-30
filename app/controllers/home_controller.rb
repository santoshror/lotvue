class HomeController < ApplicationController

  def dashboard
   @roles =  Role.all.order(role_name: :asc)
  end

  def new_role
    @role = Role.new
    respond_to do |format|
      format.js
    end
  end

  def create_role
    @role =  Role.create(role_params)
    respond_to do |format|
      format.js
    end
  end

  def roles_list
    @roles =  Role.all.order(role_name: :asc)
  end

  def manage_roles
if params[:role].present?
   @roles = Role.where(id: params[:role])
   if params[:act_typ] == "Active"
   @roles.update_all(role_status: true)
   else
     @roles.update_all(role_status: false)
   end
   end
   respond_to do |format|
     format.js
   end
  end


  private

  def role_params
    params.require(:role).permit(:role_name,:role_status)
  end


end

