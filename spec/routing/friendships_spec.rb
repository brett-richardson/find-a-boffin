require 'spec_helper'


describe 'Friendships routing' do

  specify{ expect( get: '/members/1/friendships/new' ).to route_to(
    action: 'new', controller: 'friendships', member_id: '1'
  ) }


  specify{ expect( get: '/friendships.json' ).to route_to(
    action: 'index', controller: 'friendships', format: 'json'
  ) }

end
