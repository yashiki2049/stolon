class PostsController < ApplicationController
  def index
    @photos = Photo.includes(:user).order("created_at DESC")
  end
end
