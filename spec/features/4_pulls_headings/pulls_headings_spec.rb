require 'spec_helper'


describe 'Pulling headings' do
  before{ Capybara.current_driver = :selenium }

  let( :url    ){ 'http://www.dablweb.com' }
  let( :member ){ create :member, website: url }

  pending{
    visit url

    h1_content = find( 'h1' ).text
    h2_content = find( 'h2' ).text
    h3_content = find( 'h3' ).text

    member.save!
    visit member_url member

    page.should have_content h1_content
    page.should have_content h2_content
    page.should have_content h3_content
  }
end