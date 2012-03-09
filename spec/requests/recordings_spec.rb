require 'spec_helper'

describe "Recordings" do
  describe "GET /recordings" do
    it "display some recordings" do
      visit recordings_path
      page.target.should have_content 'Sign'
      
    end
  end
end
