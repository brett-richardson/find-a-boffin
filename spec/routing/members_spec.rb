require 'spec_helper'


describe 'Members routing' do
  describe 'GET new' do
    specify{
      expect( get 'members/new' ).to route_to(
        controller: 'members', action: 'new'
      )
    }
  end
end