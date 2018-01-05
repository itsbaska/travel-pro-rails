class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    return invalid_login unless @user

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = ["Either your username or password were incorrect"]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    @current_user = nil
    redirect_to root_path, status: 303
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end