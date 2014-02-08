require 'spec_helper'


describe 'Displays a list of members at /members' do
  before{ 3.times{ create :member } }

  specify{
    visit members_path

    page.should have_text Member.last.short_url
    page.should have_text Member.last.name
  }
end
