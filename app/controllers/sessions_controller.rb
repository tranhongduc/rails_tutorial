# frozen_string_literal: true

# Controller responsible for handling actions related to SessionsController.
class SessionsController < ApplicationController
  before_action :load_user, only: %i(create)
  before_action :authenticate_user, only: %i(create)

  def new; end

  def create
    reset_session
    log_in @user
    params.dig(:session, :remember_me) == "1" ? remember(@user) : forget(@user)
    redirect_to @user
  end

  def destroy
    log_out
    redirect_to root_path, status: :see_other
  end

  private

  def load_user
    @user = User.find_by(email: params.dig(:session, :email)&.downcase)
    return if @user

    flash[:danger] = t("errors.title")
    redirect_to root_path
  end

  def authenticate_user
    return if @user&.authenticate(params.dig(:session, :password))

    render :new, status: :unprocessable_entity
  end
end
