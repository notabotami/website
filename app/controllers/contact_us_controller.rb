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
    @prefer_spanish=params['prefer_spanish']

    ExampleMailer.sample_email(@email,@name,@phone,@contact,@question,@prefer_spanish).deliver!

    redirect_to contact_us_path
  end

end