# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController

  before_action :set_user, only: %i[show edit update]
  before_action :require_user, :account_owner?, only: %i[edit update destroy]

  def show
    @page_num = params[:page]
    @articles = @user.articles.page(@page_num)
  end

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def edit; end

  def update
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
      session[:user_id] = @user.id
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

  def account_owner?
    if current_user != @user
      flash[:notice] = 'You can only perform this action on your own account.'
      redirect_to @user
    end
  end
end