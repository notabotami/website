class PhotoGalleryController < ApplicationController

  #GET /home
  #TODO should show home page
  def photo_gallery

    respond_to do |format|
      format.html # renders home.html.erb
      format.js {} # renders home.js.erb
    end
  end

end