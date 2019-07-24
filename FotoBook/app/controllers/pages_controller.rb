class PagesController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :new, :edit]
  def edit
    @another_users = User.where(id: params[:id]).first
    if @another_users.id == current_user.id
      redirect_to my_profile_path
    end
    @photos = @another_users.photos.where(sharing_mode: :isPublic)
    @albums = @another_users.albums.where(sharing_mode: :isPublic)
    @user_followings = @another_users.following
    @user_followers = @another_users.followers
  end
end
