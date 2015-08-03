class EmailController < ApplicationController


  def sample_email

    ExampleMailer.sample_email.deliver!

    redirect_to home_path
  end

end