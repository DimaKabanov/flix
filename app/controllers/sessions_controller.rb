# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email_or_username]) || User.find_by(username: params[:email_or_username])

    if user&.authenticate(params[:password])
      sign_in user
      redirect_to user, notice: t('.success', name: user.name)
    else
      flash.now[:alert] = t('.failed')
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to movies_url, notice: t('.success')
  end
end
