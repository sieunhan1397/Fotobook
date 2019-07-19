class VotesController < ApplicationController
  def create
    @photos = Photo.find(params[:photo_id])
    @photos.liked_by current_user
    redirect_to request.referrer
    # respond_to do |format|
    #   format.html{redirect_to root_path}
    #   format.js
    # end
  end

  def destroy
    @photos = Photo.find(params[:photo_id])
    @photos.disliked_by current_user
    redirect_to request.referrer
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.js
    # end
  end
end