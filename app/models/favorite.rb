class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :favorite,polymorphic: true, touch: true
	validates :user_id,:favorite_id,:favorite_type, presence: true

	def self.favorite(like)
    favorite = { favorite_type: like.class.to_s, favorite_id: like.id }
  end
end