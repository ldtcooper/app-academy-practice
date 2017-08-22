class ArtworkController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find_by(artwork_id)
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update

  end


  def destroy

  end

  private

  def artwork_params
    params[:artwork].permit(:title, :image_url, :artist_id)
  end

  def artwork_id
    params[:id]
  end

end
