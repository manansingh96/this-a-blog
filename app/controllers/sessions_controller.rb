class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email_id: params[:session][:email_id].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to user
    else
      flash.now[:alert] = 'There was something wrong'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out successfully'
    redirect_to root_path
  end
end