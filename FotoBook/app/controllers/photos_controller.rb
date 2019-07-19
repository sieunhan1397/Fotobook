class PhotosController < ApplicationController

  def index
    @photos = Photo.order('created_at')
  end

 #New action for creating a new photo
 def new
  @photo = Photo.new
end

def edit
  @photo = Photo.find(params[:id])
end
 #Create action ensures that submitted photo gets created if it meets the requirements
 def create
  puts "---------------------------------------------"
  puts params
  @photo = Photo.new(photo_params)
  @photo.user_id = current_user.id if current_user
  if @photo.save
    flash[:notice] = "Successfully added new photo!"
    redirect_to my_profile_path
  else
    flash[:alert] = "Error adding new photo!"
    render :new
  end
end

def update
  @photo = Photo.find(params[:id])
  puts @photo.id
  if @photo.update_attributes(photo_params)
    redirect_to my_profile_path
  else
    redirect_to edit_photo_path
  end
end
   #Destroy action for deleting an already uploaded image
   def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "Successfully deleted photo!"
      redirect_to my_profile_path
    else
      flash[:alert] = "Error deleting photo!"
      redirect_to edit_photo_path
    end
  end
  def like
    @photo = Photo.find(params[:id])
    @photo.liked_by current_user
    redirect_to request.referrer
  end
  def dislike
    @photo = Photo.find(params[:id])
    @photo.disliked_by current_user
    redirect_to request.referrer
  end
  private

 #Permitted parameters when creating a photo. This is used for security reasons.
 def photo_params
  params.require(:photo).permit(:title, :image, :description, :sharing_mode)
end
end
