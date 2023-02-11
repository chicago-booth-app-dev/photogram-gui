class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    photo_id = params.fetch("photo_id")
    @photo = Photo.all.where({ :id => photo_id }).first
    render({ :template => "photo_templates/photo.html.erb" })
  end
end
