class UsersController < ApplicationController


  def index
   @user = User.all
  end

  def new
   @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  if @user.save
    log_in @user
    flash[:success] = "Sign up complete !"
    redirect_to @user
  else
    render 'new'
  end
  end

  def update
      @user = User.find(params[:id])
    if @user.update(mous_params)
    redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @user
  end

  def secret
    unless logged_in?
      flash.now[:danger] = "Tu doit etre Log in pour voir cette page"
      redirect_to home_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
