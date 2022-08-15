class UsersController < ApplicationController
  def home
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end