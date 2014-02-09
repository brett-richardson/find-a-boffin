require 'spec_helper'


describe FriendshipsController do

  let( :member ){ create :member }


  describe 'GET :member_id/friendships/new' do
    let( :request ){ get :new, member_id: member.id }

    specify{ request and response.should be_success }
  end

end
