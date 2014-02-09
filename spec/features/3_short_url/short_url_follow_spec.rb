require 'spec_helper'


describe 'Has a short URL generated with Goog.gl' do
  let( :member ){
    create :member, website: 'http://dablweb.com/url_creation', short_url: nil
  }

  specify{
    visit member_path member
    find( '.short_url a' )['href'].should match %r{http://goo.gl/.*}
    find( '.website a'   )['href'].should match %r{http://dablweb.com}
  }
end
