class PrivacyController < ApplicationController

  def privacy

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

end