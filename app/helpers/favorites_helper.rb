module FavoritesHelper
	def favorite_likes_tag like
    @count = Favorite.where("favorite_type = ? and favorite_id = ?", like[:favorite_type], like[:favorite_id]).count
    if @count > 0
      likes_count = @count
    else
      likes_count = ''
    end

    if current_user && current_user.liking?(like)
      link_title = "unlike"
      link_path_method = "delete"
      fa_icon = '<i class="red heart icon"></i>'
    else
      link_title = "like"
      link_path_method = "post"
      fa_icon = '<i class="red heart empty icon"></i>'
    end

    if current_user.blank?
      "#{likes_count}#{fa_icon}".html_safe 
    else
      link_to "#{likes_count}#{fa_icon}".html_safe, 
                                                        favorite_path(like), 
                                                        title: link_title, 
                                                        class: "animated zoomIn",
                                                        method: link_path_method, 
                                                        remote: true
      end

  end
end
