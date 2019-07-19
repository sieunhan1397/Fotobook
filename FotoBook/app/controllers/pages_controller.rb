class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :new, :edit]

  def index
    @photos = current_user.photos.all
    @albums = current_user.albums.all
  end

  def new
  end
  def edit
    @another_users = User.where(id: params[:id]).first
    @photos = @another_users.photos.all
    @albums = @another_users.albums.all
    @user_followings = @another_users.following
    @user_followers = @another_users.followers
  end
  def discover
    @photos = Photo.where.not(user_id: current_user.id)
    @photos = @photos.sort_by {|a| a.updated_at}.reverse
    @albums =  Album.where.not(user_id: current_user.id)
    @albums = @albums.sort_by {|a| a.updated_at}.reverse
  end
  def sendPic
    @album = Album.find(params[:Album_id])
    @pics = @album.pictures
    album_pics = []
    @pics.each do |pic|
      album_pics.push(pic.image.url)
    end
    render json: {pics: album_pics, title: @album.title, description: @album.description}
  end
end
