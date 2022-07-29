# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user, notice: t('.success')
    else
      render :new
    end
  end

  def edit
    @user = user
  end

  def update
    if user.update(user_params)
      redirect_to user, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to movies_url, alert: t('.success')
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
