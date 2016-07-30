class SongsController < ApplicationController
  before_action :require_login, only: [ :new, :create, :collect, :edit, :update, :destroy ]
  before_action :find_song, only: [ :edit, :update, :destroy ]
  protect_from_forgery except: :create

  def index
    @songs = Song.includes(:user).all.order("created_at desc").page params[:page]
    @body_class = "toolkit"
    respond_to do |format|
        format.html { render '_index' }
        format.js 
      end
  end

  def new
  	@song = current_user.songs.build
  end

  def create
   @song = current_user.songs.build(song_params)
    if @song.save
      flash.now[:success] = "#{t('.success')}"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash.now[:error] = "#{t('.faild')}"
      respond_to do |format|
        format.html { render 'new' }
        format.js
      end
    end
  end
  
  def test
    songs_id = current_user.favorites.where("favorite_type = ?", "Song").collect(&:favorite_id)
    @songss = Song.find(songs_id).reverse!
    @user_panel = true
    if @songss.empty?
      @recommend = true
      @songs = Song.hot_songs.page params[:page]
    else
      @songs = Kaminari.paginate_array(@songss).page(params[:page])
    end
  end

  private

  def song_params
    get_val = params.require(:song).permit(:title,:artist,:pic,:attachment)
    new_id = Song.select('s_id').last
    get_val[:s_id] = new_id[:s_id].to_i  + 1
    get_val
  end


end