class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit]

  def index
    @photos = current_user.photos.all
    @albums = current_user.albums.all
  end

  def new
  end
  def edit
    @photos = current_user.photos.all
    @albums = current_user.albums.all
  end
  def discover
    @photos = Photo.where.not(user_id: current_user.id)
    @photos= @photos.sort_by {|a| a.updated_at}.reverse
    @albums =  Album.where.not(user_id: current_user.id)
    @albums = @albums.sort_by {|a| a.updated_at}.reverse
  end
end
