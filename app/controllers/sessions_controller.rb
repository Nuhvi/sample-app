# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # log in
    else
      flash.now[:danger] = 'Invalud email/paswword compination'
      render 'new'
    end
  end

  def destroy; end
end
