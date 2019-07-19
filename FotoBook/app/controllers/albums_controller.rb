class AlbumsController < ApplicationController
  def index
    @albums = Album.order('created_at')
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
    @pictures = @album.pictures.all
  end
  def create
    puts "---------------------------"
    puts params
    @album = Album.new(album_params)
    @album.user_id = current_user.id if current_user
    respond_to do |format|
      if @album.save
        if params[:images]
          params[:images].each { |image|
            @album.pictures.create(image: image)
          }
        end

        format.html { redirect_to my_profile_path, notice: "Album was successfully created." }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @album = Album.find(params[:id])
    @pictures = @album.pictures.all
    if @album.update_attributes(album_params)
      if params[:images]
        params[:images].each { |image|
          @album.pictures.create(image: image)
        }
      end
      redirect_to my_profile_path
    else
      redirect_to edit_album_path
    end
  end
  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      flash[:notice] = "Successfully deleted album!"
      redirect_to my_profile_path
    else
      flash[:alert] = "Error deleting album!"
      redirect_to edit_album_path
    end
  end
  def like
    @album = Album.find(params[:id])
    @album.liked_by current_user
    redirect_to request.referrer
  end
  def dislike
    @album = Album.find(params[:id])
    @album.disliked_by current_user
    redirect_to request.referrer
  end
  private

 #Permitted parameters when creating a photo. This is used for security reasons.
 def album_params
  params.require(:album).permit(:title, :description, :sharing_mode)
end
end
