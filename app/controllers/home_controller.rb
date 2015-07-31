class HomeController < ApplicationController

  #GET /home
  #TODO should show home page
  def home

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

end