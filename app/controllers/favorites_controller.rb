class FavoritesController < ApplicationController
	before_action :require_login, :find_favorite

  include FavoritesHelper
  
  def create
    current_user.like!(params[:favorite_type], params[:favorite_id])
    respond_to do |format|
      format.html { redirect_to correct_path }
      format.js
    end
  end

  def destroy
    current_user.unlike!(params[:favorite_type], params[:favorite_id])
    respond_to do |format|
      format.html { redirect_to correct_path }
      format.js
    end
  end
 
  private
    def find_favorite
      @favorite = Favorite.favorite(Kernel.const_get(params[:favorite_type]).find(params[:favorite_id])) 
    end
end
