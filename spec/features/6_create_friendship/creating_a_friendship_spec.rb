require 'spec_helper'


describe 'creating a friendship' do
  before{ 3.times{ create :member } }

  specify{
    visit member_url Member.last
    click_on 'Create Friendship'
    page.should have_selector 'form'
  }
end
