# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController

  before_action :set_user, only: %i[show]

  def show
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(user_params)
      flash[:notice] = 'Account details updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the blog #{@user.username}, your account is created."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email_id, :password)
  end
end