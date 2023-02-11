class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    photo_id = params.fetch("photo_id")
    @photo = Photo.all.where({ :id => photo_id }).first
    render({ :template => "photo_templates/photo.html.erb" })
  end

  def delete
    photo_id = params.fetch("photo_id")
    @photo = Photo.all.where({ :id => photo_id }).first
    @photo.destroy
    redirect_to("/photos") # send them to a page after the photo is deleted
  end
end
