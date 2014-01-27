require 'spec_helper'


describe Member do
  subject( :member ){ build :member }

  describe 'validations' do
    describe 'name' do
      it{ should validate_presence_of :name }
      it{ should allow_value( 'Joe Bloggs', 'Brett Richardson' ).for :name }
    end

    describe 'website' do
      it{ should     allow_value( 'http://www.go.com', 'https://be.in'   ).for :website }
      it{ should_not allow_value( 'ftp://test.com', 'Google', '<script>' ).for :website }
    end
  end
end