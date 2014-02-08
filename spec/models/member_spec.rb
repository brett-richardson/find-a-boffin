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

  describe 'url shortening' do
    before{ UrlShortener.stub syncronous: 'http://test.co/abc' }

    it 'creates a short url before validation' do
      subject.save
      subject.short_url.should match Url::FORMAT
    end
  end

  describe 'content scraping' do
    let( :content_hash ){ { 'h1' => 'Head 1', 'h2' => 'Head 2', 'h3' => 'Head 3' } }

    before{ ContentFinder.stub syncronous: content_hash }

    it 'scrapes content from website before validation' do
      subject.valid?
      subject.content.should be_a Hash
    end
  end
end
