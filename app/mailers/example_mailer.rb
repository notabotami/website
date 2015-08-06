class ExampleMailer < ActionMailer::Base
  default :from => "48street@example.com"
  #example@example.com

  def contact_email(email,name,phone,contact_option,question,prefer_spanish)
    @email = email
    @name = name
    @phone = phone
    @contact_option= contact_option
    @question= question
    @prefer_spanish=prefer_spanish

    logger.tagged("mailer contact option") {logger.debug @contact_option}

    time = Time.new
    mail(:to => "48streetincometax@gmail.com", :subject => "48thStreet Contact Form - " + @name + " - " +time.strftime("%Y-%m-%d %H:%M:%S %Z") )
  end

  def employment_email(email,name,phone,contact_option,info,prefer_spanish,file)

    @email = email
    @name = name
    @phone = phone
    @contact_option= contact_option
    @info= info
    @prefer_spanish=prefer_spanish

    attachments["#{file.original_filename}"] = File.read(file.path)
    time = Time.new
    mail(:to => "48streetincometax@gmail.com",
         :subject => '48thStreet Employee Application - ' + @name + ' - ' + time.strftime("%Y-%m-%d %H:%M:%S %Z"))
  end



end
