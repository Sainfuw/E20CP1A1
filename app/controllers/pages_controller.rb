class PagesController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def dashboard
    authorize! :dashboard, :page
    @users = User.all
    @user = User.new
  end

  def update
    authorize! :update, :page
    new_role = params[:user][:role]
    @user.role = new_role
    @user.save!
    render json: @user.as_json
  end

  def destroy
    authorize! :destroy, :page
    @user.destroy
    redirect_to dashboard_pages_path, notice: "User #{@user.name} deleted!"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:role)
  end
end
