require 'spec_helper'


describe 'Pulling headings' do

  let( :url    ){ root_url }
  let( :member ){ build :member, website: url }


  context 'with stubbed service' do
    before{
      ContentFinder.stub( :syncronous ).and_return( {
        'h1' => 'Heading 1',
        'h2' => 'Heading 2',
        'h3' => 'Heading 3'
      } )
    }

    specify{
      member.save
      visit member_path member

      page.should have_text 'Heading 1'
      page.should have_text 'Heading 2'
      page.should have_text 'Heading 3'
    }
  end

end
