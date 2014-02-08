require 'spec_helper'

describe MemberDecorator do

  let( :member ){ build :member, id: 1 }
  subject{ described_class.new member }


  its( :website     ){ should be_a String }
  its( :linked_name ){ should be_a String }

  context 'with a short_url' do
    before( :each ){ member.short_url = 'http://goo.gl/abc' }

    its( :short_url ){ should include 'href="http://goo.gl/abc"' }
  end

  context 'with some HTML in @content' do
    before( :each ){ member.content = { 'h1' => 'Test Content' } }

    specify{ subject.content_from( 'h1' ).should include 'Test Content' }
  end

end
