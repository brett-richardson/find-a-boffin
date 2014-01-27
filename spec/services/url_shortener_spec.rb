require 'spec_helper'


describe UrlShortener do
  let( :url ){ 'http://www.google.com/long-path-here' }

  describe '.syncronous' do
    subject{ described_class.syncronous url }

    it{ should be_a String }
    it{ should match Url::FORMAT }
    its( :length ){ should be < url.length }
  end
end
