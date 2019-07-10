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
end
