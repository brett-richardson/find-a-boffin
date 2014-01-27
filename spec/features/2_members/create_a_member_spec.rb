require 'spec_helper'


describe 'Creating a member' do
  specify{
    visit      '/'
    click_link 'Create Member'

    within 'form' do
      fill_in  'Name',    with: 'Joe Bloggs'
      fill_in  'Website', with: 'http://www.dablweb.com'
      click_on 'Create Member'
    end

    page.should have_selector 'h1', text: 'Joe Bloggs'
  }
end