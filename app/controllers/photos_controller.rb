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

  def add
    image_url = params.fetch("image")
    caption = params.fetch("caption")
    owner_id = params.fetch("owner_id")

    photo = Photo.new
    photo.image = image_url
    photo.caption = caption
    photo.owner_id = owner_id
    photo.save

    redirect_to("/photos/" + photo.id.to_s)
  end

  def update
    photo_id = params.fetch("photo_id")
    image_url = params.fetch("image")
    caption = params.fetch("caption")
    owner_id = params.fetch("owner_id")

    photo = Photo.all.where({ :id => photo_id }).first
    photo.image = image_url
    photo.caption = caption
    photo.owner_id = owner_id
    photo.save

    redirect_to("/photos/" + photo_id.to_s)
  end
end
