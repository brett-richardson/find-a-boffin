require 'spec_helper'


describe MembersController do
  let( :member ){ create :member }

  describe 'GET new' do
    let( :request ){ get :new }

    specify{ request and response.should be_success }
    specify{ request and assigns[:member].should be_a Member }
  end

  describe 'GET show' do
    let( :request ){ get :show, id: member.id }

    specify{ request and response.should be_success }
    specify{ request and assigns[:member].should be_a Member }
  end

  describe 'POST create' do
    let( :attrs   ){ attributes_for :member }
    let( :request ){ post :create, member: attrs }

    specify{ request and response.should be_redirect }

    it 'creates 1 new member' do
      expect{ request }.to change( Member, :count ).by 1
    end
  end
end