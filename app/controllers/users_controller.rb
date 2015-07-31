class UsersController < ApplicationController


  # GET /users
  # GET /users.json
  #displays all users
  def index
    @secure_attrs = [:id,:session_token,:password,:created_at,:updated_at]
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  #displays a single user's profile
  def show
    @user = User.find(params[:id])
    can_edit_hash = Permissions.currentLoggedInOrHasMorePermissions(@current_user,@user)
    @can_edit = can_edit_hash[:has_permission]

    #max needs
    @can_see_pref= Permissions.is_at_least_manager(@current_user)

    profile_attrs = [:first_name,:last_name, :email,:phone_number]
    @first_name = @user.first_name
    @last_name = @user.last_name
    @email = @user.email
    @phone_number = @user.phone_number
    @role = @user.role
  end

  # GET /users/new
  # GET /users/new.json
  #handles user account creation
  def new
    #instantiate so that @user is defined in view
    @user = User.new

    flash[:success] = "Fill in all fields to create an account"


  end

  # GET /users/1/edit
  #handles user profile editing
  def edit
    @user = User.find(params[:id])
    logger.tagged("edit current user: ") {logger.debug @current_user.attributes}
    #TODO : make sure permissions are handled correctly
    can_edit_hash = Permissions.currentLoggedInOrHasMorePermissions(@current_user,@user)
    logger.tagged("edit user perm hash: ") {logger.debug can_edit_hash}
    if can_edit_hash[:has_permission]
      can_destroy_hash = Permissions.hasMorePermissions(@current_user,@user)
      @can_destroy = can_destroy_hash[:has_permission]
    else
      flash[:warning] = can_edit_hash[:permission_message]
      redirect_to user_path(@user)
    end

  end

  # POST /users
  # POST /users.json
  #actually creates a user
  def create
      @user = User.new_user(params[:user])
      @user.attributes.each do |attr, val|
        logger.debug("attr: #{attr}, val: #{val}")
      end

      if @user.save
        flash[:success] = "Successfully created account, please sign in"
        redirect_to login_path
      else
        flash[:warning] = "Couldn't process the user"
        render action: "new"
      end

  end

  # PUT /users/1
  # PUT /users/1.json
  #actually edits a user's profile
  def update
    @user = User.find(params[:id])
    logger.tagged("update current user: ") {logger.debug @current_user.attributes}
    can_edit_hash = Permissions.currentLoggedInOrHasMorePermissions(@current_user,@user)
    logger.tagged("update user perm hash: ") {logger.debug can_edit_hash}
    if can_edit_hash[:has_permission]
      user_params = params[:user]
      logger.tagged(":user") {logger.debug user_params}
      @user.first_name = user_params[:first_name]
      @user.last_name = user_params[:last_name]
      @user.email = user_params[:email]
      @user.phone_number = user_params[:phone_number]
      @user.password_confirmation = @user.password

      can_change_roles_hash = Permissions.hasMorePermissions(@current_user,@user)
      @can_change_roles = can_change_roles_hash[:has_permission]
      if @can_change_roles
        @user.role = user_params[:role]
      else
        flash[:warning] = "Don't have permission to promote/demote"
      end

      if @user.save
        redirect_to user_path(@user)
      else

        @user.errors.full_messages.each do |msg|
          logger.tagged("error: ") {logger.debug msg}
        end
        flash[:warning] = "Couldn't save changes"
        redirect_to user_path(@user)
      end
    else
      flash[:warning] = can_edit_hash[:permission_message]
      redirect_to user_path(@user)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  #deletes a user account
  def destroy

    logger.tagged("destroy","beginning") {logger.debug "I'M HERE!"}
    @user = User.find(params[:id])
    can_destroy_hash = Permissions.hasMorePermissions(@current_user,@user)
    @can_destroy = can_destroy_hash[:has_permission]
    if @can_destroy

      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { head :no_content }
      end
    else
      flash[:warning] = can_destroy_hash[:permission_message]
      redirect_to user_path(@user)
    end

  end

  def trade
    @user = @current_user
    @shift = Shift.find(params[:shift_id])
    shift_owner = User.find(@shift.user_id)
    @name = shift_owner.last_name + ", " +shift_owner.first_name
    @date = @shift.date.strftime("Starts at %I:%M%p on %A %m/%u")
  end

  def view_profile
    @user = @current_user
    @first_name = @user.first_name
    @last_name = @user.last_name
    @email = @user.email
    @phone_number = @user.phone_number
    @role = @user.role
  end

end
