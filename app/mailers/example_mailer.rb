class ExampleMailer < ActionMailer::Base
  default :from => "from@example.com"

  def sample_email
    mail(:to => "blurgiamtrash@gmail.com", :subject => "Sample Email")
  end
end
