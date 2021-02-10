class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    tag_list = params[:photo][:tag_name].split(nil)
    if @photo.save
      @photo.save_tag(tag_list) 
      redirect_to root_path
    else
      render :new
    end
 end

 def show
  @photo = Photo.find(params[:id])
  # @user = User.find(params[:id])
  @photo_tags = @photo.tags
 end

 private
 def photo_params
   params.require(:photo).permit(:title, :text, :image).merge(user_id: current_user.id)
 end

end