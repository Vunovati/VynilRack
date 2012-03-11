namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		Recording.create!(:artist => "Led Zeppelin",
			:title => "Houses of The Holy",
			:published => Time.now,
			:user_id => 1)

		99.times do |n|
			artist = Faker::Name.name
			title = "The #{n+1} album"
			published = n.years.ago
			Recording.create!(:artist => artist,
				:title => title,
				:published => published,
				:user_id => 1)
		end
	end
end