class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @user_followings = current_user.following
    @photos = []
    @albums = []
    sort_photos = Photo.where(sharing_mode: :isPublic).order(updated_at: :desc)
    sort_albums = Album.where(sharing_mode: :isPublic).order(updated_at: :desc)
    @photos = sort_users(sort_photos,@user_followings)
    @albums = sort_users(sort_albums,@user_followings)
    @photos = @photos.paginate page: params[:photo_page], per_page: 4
    @albums = @albums.paginate page: params[:album_page], per_page: 4
  end
  def sort_users a, b
    temp = []
    a.each do |i|
      b.each do |j|
        if i.user_id == j.id
          temp.push(i)
        end
      end
    end
    return temp
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @photos = current_user.photos.all
    @albums = current_user.albums.all
    @another_users = User.where.not(id: current_user.id)
    @user_followings = @user.following
    @user_followers = @user.followers
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to my_profile_path, notice: 'User was successfully update.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def discover
    @photos = Photo.where(sharing_mode: :isPublic).order(updated_at: :desc).paginate page: params[:photo_page], per_page: 4
    @albums = Album.where(sharing_mode: :isPublic).order(updated_at: :desc).paginate page: params[:album_page], per_page: 4
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :avatar)
    end
  end
