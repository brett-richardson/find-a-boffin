require 'spec_helper'


describe Friendship do
  let( :member ){ create :member }
  subject{ build :friendship }

  it{ should belong_to :member }
  it{ should belong_to :target }

  it{ should validate_presence_of :member }
  it{ should validate_presence_of :target }

  context 'when user and target are the same' do
    before( :each ){ subject.member = member and subject.target = member }

    it{ should_not be_valid }
  end
end
