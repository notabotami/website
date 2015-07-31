class SessionsController < ApplicationController

  def login
    respond_to do |format|

      format.html {}
      format.js {}
    end
  end

  def forgot_password

  end

  def create
    logger.tagged("creating the session") {logger.debug params}
    @user = User.findByUserIdAndPassword(params[:user_id],params[:password])
    if !@user.nil?
      session[:session_token] = @user.session_token
      flash[:success] = "Successfully logged in as %s" % @user.user_id
      redirect_to user_view_profile_path
    else
      flash[:warning] = "Sorry, not valid login credentials"
      redirect_to login_path
    end
  end

  def destroy
    session[:session_token] = nil
    flash[:success] = "Successfully logged out"
    redirect_to home_path
  end


end
