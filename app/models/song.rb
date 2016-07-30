class Song < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	mount_uploader :pic , AttachmentUploader
	belongs_to :user

 	require 'json'
 		songs_json = []
 		Song.all.each do |song|
 		
		song_json = { 
			"id" => song.id,
		    "title" => song.title,
		    "artist" => song.artist,
		    "pic" => song.pic.url,
		    "url" => song.attachment.url
		}
		 songs_json << song_json
		end
		File.open("app/assets/music/test.json","w") do |f|
		  f.write(JSON.pretty_generate(songs_json))
		
	end
end