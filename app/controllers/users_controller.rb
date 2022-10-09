class UsersController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      # session[:user_id] = @user.id
      flash[:notice] = "User Created Successfully !"
      redirect_to new_user_path
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to new_user_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
