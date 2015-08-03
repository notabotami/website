class ItinController < ApplicationController


  def itin

    respond_to do |format|
      format.html
      format.js {}
    end

  end

end