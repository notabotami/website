class ContactUsController < ApplicationController


def contact_us

respond_to do |format|
format.html # renders home.html.erb
format.js {} # renders home.js.erb
end
end

  def contact_us_submit

    redirect contact_us_path
  end

end