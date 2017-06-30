class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists  
    #Overwrites the assumption to render an index.html.erb
  end

def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    render json: {
           artist: @artist, 
           songs: @songs
    }
  end

def create
  @artist = Artist.new(artist_params)

  if @artist.save!
    redirect_to artist_path(@artist)
  else
    render status: 500, 
    json: {
      error: artist.errors
    }
  end
end

def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
  if @artist.update(artist_params)
    redirect_to artist_path(@artist)
  else
    render status: 500, 
    json: {
      error: artist.errors
    }
  end 
end

def destroy
     @artist = Artist.find(params[:id])
     if @artist.destroy
      redirect_to artists_path
     else
       render status: 500, 
              json: {
              error: "Could not delete Artist"
              }
  end
end

    private
    def artist_params
        params.require(:artist).permit(:name, :photo_url, :nationality)
    end
end
