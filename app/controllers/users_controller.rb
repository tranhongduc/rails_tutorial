# frozen_string_literal: true

# Controller responsible for handling UsersController.
class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:success] = t("users.new.success_message")
      redirect_to @user
    else
      flash.now[:danger] = t("users.new.error_message")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
