class ExampleMailer < ActionMailer::Base
  default :from => "example@example.com"

  def sample_email(email,name,phone,contact_option,question,prefer_spanish)
    @email = email
    @name = name
    @phone = phone
    @contact_option= contact_option
    @question= question
    @prefer_spanish=prefer_spanish

    mail(:to => "blurgiamtrash@gmail.com", :subject => "Sample Email")
  end

end
