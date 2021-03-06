class ContactUsController < ApplicationController


  def contact_us

    respond_to do |format|
    format.html # renders home.html.erb
    format.js {} # renders home.js.erb
    end
  end

  def contact_us_submit

    @email=params['email']
    @name=params['name']
    @phone=params['phone']
    @contact_option=params['contact_option']
    @question=params['question']
    @prefer_spanish= if params['prefer_spanish'].nil? then "I prefer English" else "I prefer Spanish" end

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

    if @question.empty?
      @question_warning = true
    end

    if @question_warning or @name_warning or @email__warning
      flash[:warning]= ContactUsHelper.send(ApplicationHelper.get_language_tag + "contact_us_alert")
      render "contact_us/contact_us"
    else
      flash[:success]=ContactUsHelper.send(ApplicationHelper.get_language_tag + "contact_us_success")
      #TODO UNCOMMENT for production
      ExampleMailer.contact_email(@email,@name,@phone,@contact_option,@question,@prefer_spanish).deliver!
      redirect_to contact_us_path
    end



  end

end