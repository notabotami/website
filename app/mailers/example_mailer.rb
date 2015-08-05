class ExampleMailer < ActionMailer::Base
  default :from => "example@example.com"

  def sample_email
    mail(:to => "blurgiamtrash@gmail.com", :subject => "Sample Email")
  end
end
