class PhotosController < ApplicationController
  def new
    @Photo = Photo.new
  end


  def create
    @Photo = Photo.new(photo_params)
    if @Photo.save
      redirect_to root_path
    else
      render :new
    end
 end

 private
 def photo_params
   params.require(:photo).permit(:title, :text, :image, tag_ids: []).merge(user_id: current_user.id)
 end

end