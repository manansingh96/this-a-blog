# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController

  # before_action :set_user, only
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the blog #{@user.username}, your account is created."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def set_user
    @article = Article.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email_id, :password_digest)
  end
end