class ExampleMailer < ActionMailer::Base
  default :from => "example@example.com"

  def contact_email(email,name,phone,contact_option,question,prefer_spanish)
    @email = email
    @name = name
    @phone = phone
    @contact_option= contact_option
    @question= question
    @prefer_spanish=prefer_spanish

    logger.tagged("mailer contact option") {logger.debug @contact_option}

    time = Time.new
    mail(:to => "48streetincometax@gmail.com", :subject => "48thStreetIncomeTax Contact Form - " + @name + " - " +time.strftime("%Y-%m-%d %H:%M:%S %Z") )
  end

  def employment_email()

    attachments['gplus.png'] = File.read("#{Rails.root}/app/assets/images/gplus.png")
    mail(:to => "blurgiamtrash@gmail.com",
         :subject => "Sending attachment")
  end



end
