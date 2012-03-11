require 'spec_helper'

describe "Recordings" do
	
	before do	
		@recording = Recording.create :artist => "Test Zeppelin", :title => "III", :published => Time.now, :id => 1 
	end

	describe "GET /recordings" do
		it "display some recordings" do

			visit recordings_path
			page.should have_content 'Test Zeppelin'
		end

	end

	describe "GET /recordings" do
		it "search for a recording" do

			visit recordings_path
			fill_in 'search', :with => 'Test '
			click_button 'Search'
			page.should have_content 'Test Zeppelin'
		end

	end


	describe "GET /recordings/new" do
		it "create a new recording" do
			visit new_recording_path
			fill_in 'Artist', :with => 'Black Test'
			fill_in 'Title', :with => 'Black Title'
			click_button 'Create Recording'

			page.should have_content 'Black Title'

		end
	end

	describe "PUT /recordings" do
		it "go to the add recording path" do
			visit recordings_path
			click_link 'New'

			current_path.should == new_recording_path 
		end

		it "go to edit recording path" do
			visit recordings_path
			click_link 'Edit'

			current_path.should == edit_recording_path(@recording)
			
			find_field('Artist').value.should == 'Test Zeppelin'

			fill_in 'Artist', :with => 'Black Test'
			fill_in 'Title', :with => 'Black Title'
			click_button 'Update Recording'

			current_path.should == recording_path(@recording)
			page.should have_content 'Black Title'
			# find_field('Artist').value.should == 'Black Test'

		end
		it "should not update an empty recording" do
			visit recordings_path
			click_link 'Edit'
			current_path.should == edit_recording_path(@recording)

			fill_in 'Artist', :with => ''
			fill_in 'Title', :with => ''
			click_button 'Update Recording'

			current_path.should == edit_recording_path(@recording)
			page.should have_content 'error'
			# save_and_open_page

		end
	end	

	describe "DELETE /recordings" do
		it "should delete a recording" do
			visit recordings_path
			find("#recording_#{@recording.id}").click_link 'Destroy'
			page.should have_content "#{@recording.artist} #{@recording.title} deleted"

			visit recordings_path
			page.should have_no_content 'Test Zeppelin'
		end
	end
end
