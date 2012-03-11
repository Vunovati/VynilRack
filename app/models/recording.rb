class Recording < ActiveRecord::Base
	validates_presence_of :artist, :title 

	self.per_page = 10 # number of recorings paginated

	def self.search(search)
		if search
			where('artist LIKE ?', "%#{search}")
		else
			scoped # give all instead of searching
		end
	end

end

# == Schema Information
#
# Table name: recordings
#
#  id         :integer         not null, primary key
#  artist     :string(255)
#  title      :string(255)
#  published  :date
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

