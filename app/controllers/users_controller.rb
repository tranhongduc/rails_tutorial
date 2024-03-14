# frozen_string_literal: true

# Controller responsible for handling UsersController.
class UsersController < ApplicationController

  before_action :find_user, only: %i(show )

  def index
    @user = User.all
  end

  def show
      # @user = User.find_by id: params[:id]
      # return if @user

      # redirect_to root_path
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

  def edit
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = "Not found users!"
    redirect_to root_pathend
  end

  def update
    if @user.update user_params
    # Handle a successful update.
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end

end
