class EmployeeApplicationController < ApplicationController

  def employee_application

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

  def employee_application_submit

    @email=params['email']
    @name=params['name']
    @phone=params['phone']
    @contact_option=params['contact_option']
    @info=params['info']
    @prefer_spanish= if params['prefer_spanish'].nil? then "I prefer English" else "I prefer Spanish" end
    @file = params[:file]

    logger.tagged("contact form contact option") {logger.debug @contact_option}

    if @contact_option == "1"
      @contact_option = "I prefer email"
    else
      if @contact_option == "2"
        @contact_option = "I prefer phone"

      else
        @contact_option = "I prefer either phone or email"

      end

    end

    if @email.empty? and @phone.empty?
      @email_warning = true
      @phone_warning = true
    end

    if @name.empty?
      @name_warning = true
    end

    if @info.empty?
      @info_warning = true
    end

    if @file.nil?
      @file_warning = true
    end

    if @info_warning or @name_warning or @email__warning or @file_warning
      flash[:warning]= ContactUsHelper.send(ApplicationHelper.get_language_tag + "contact_us_alert")
      render "employee_application/employee_application"
    else
      flash[:success]=ContactUsHelper.send(ApplicationHelper.get_language_tag + "contact_us_success")
      #TODO UNCOMMENT for production
      logger.tagged("employee_application_submit") {logger.debug "Made it!"}
      ExampleMailer.employment_email(@email,@name,@phone,@contact_option,@question,@prefer_spanish,@file).deliver!
      redirect_to "/employee_application"
    end






  end

end