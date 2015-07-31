class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :setCurrentUser
  before_filter :setLanguage

  @@must_log_in_message = "Please log in first"
  @@must_be_man_message = "Must be a manager to view"

  def mustLogInFirst
    if @current_user.nil?
      flash[:notice] = @@must_log_in_message
      redirect_to login_path
    end
  end

  def setCurrentUser
    @current_user = nil
    if session[:session_token] && User.existsBySessionToken(session[:session_token])
      @current_user = User.findBySessionToken(session[:session_token])
      @current_user.password_confirmation = @current_user.password
    end
    ApplicationHelper.current_user = @current_user
  end
	
  def mustBeAtLeastManager
    if !Permissions.is_at_least_manager(@current_user)
      flash[:notice] = @@must_be_man_message
      redirect_to login_path
    end
  end

  def setLanguage
    if session[:english_token] then
      if session[:english_token] == "false" then
        @english = false

      else
        @english = true
      end
    else
      session[:english_token] = "true"
    end

    ApplicationHelper.english = @english
  end

  def change_language

    logger.tagged("change_language: ") {logger.debug @english}

    if @english then
      logger.tagged("change_language: ") {logger.debug @english}
      @english = false
      session[:english_token] = "false"

    else
      logger.tagged("change_language: ") {logger.debug @english}
      @english = true
      session[:english_token] = "true"
    end

    logger.tagged("change_language: ") {logger.debug @english}
    redirect_to home_path
  end

  def change_to_english
    @english = true
    session[:english_token]= "true"

    redirect_to home_path
  end

  def change_to_spanish
    @english = false
    session[:english_token] = "false"

    redirect_to home_path
  end
end
