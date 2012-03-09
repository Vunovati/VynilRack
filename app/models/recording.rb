class Recording < ActiveRecord::Base
	validates_presence_of :artist, :title 
end
