require 'spec_helper'


describe 'Visiting the home page' do
  specify do
    visit '/'
    page.should have_selector 'h1', text: 'Boffin'
  end
end