class WelcomeController < ApplicationController
  def index
  end

  def listing
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    role_name = params[:user][:role]
    user.add_role :"#{role_name}"
    redirect_to welcome_listing_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to welcome_listing_path
  end
end
