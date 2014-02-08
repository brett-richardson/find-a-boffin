require 'spec_helper'


describe ContentFinder do

  before{ ContentFinder.test_mode = false }
  after { ContentFinder.test_mode = true  }

  let( :url ){ 'http://www.dablweb.com' }


  describe '.syncronous', :slow do
    subject{ described_class.syncronous url }

    it{ should be_a Hash }
    specify{ subject['h1'].should be_a String }
    specify{ subject['h2'].should be_a String }
    specify{ subject['h3'].should be_a String }

    context 'with h1 and h2 selectors' do
      subject{ described_class.syncronous url, [ 'h1', 'h2' ] }

      it{ should be_a Hash }
      specify{ subject['h1'].should be_a String }
      specify{ subject['h2'].should be_a String }
      specify{ subject['h3'].should be_nil      }
    end
  end


  pending '.asyncronous'

end
