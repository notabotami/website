class AboutController < ApplicationController

  #GET /about
  #TODO should show about page
  def about

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

end