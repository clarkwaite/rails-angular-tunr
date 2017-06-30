class SongsController < ApplicationController

 def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
    render json: {
           artist: @artist, 
           songs: @songs
    }
  end

def show
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    render json: {
           artist: @artist, 
           songs: @song
    }
  end

def create
  @artist = Artist.find(params[:artist_id])
  @song = @artist.songs.new(song_params)

  if @song.save
    redirect_to artist_song_path(@artist, @song)
  else
    render status: 500, 
    json: {
      error: artist.errors
    }
  end
end

 def update
    @song = Song.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    if @song.update(song_params)
      #we don't want the bang after save because if we have it, we won't get the JSON error below, which we need to give to angular so we can render an error to the user
      redirect_to artist_song_path(@artist, @song)
    else
      render status: 500,
        json: {
        error: @song.errors
      }
    end
  end

 def destroy
    @song = Song.find(params[:id])
    @artist = @song.artist
    if @song.destroy
      redirect_to artist_songs_path(@artist)
    else
      render status: 500,
        json: {
          error: "Could not delete song"
        }
    end
  end

    private
    def song_params
        params.require(:song).permit(:title, :album, :preview_url, :artist_id)
    end
end