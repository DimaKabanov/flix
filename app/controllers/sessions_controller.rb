# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email]) ||
           User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back, #{user.name}!"
    else
      flash.now[:alert] = 'Invalid email/password combination!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: 'You\'re now signed out!', status: :see_other
  end
end
