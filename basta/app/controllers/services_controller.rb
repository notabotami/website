class ServicesController < ApplicationController

  #GET /services
  #TODO should show services page
  def services

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

end