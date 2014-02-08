# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    sequence( :name ){ |i| "User #{i}" }
    website 'http://www.dablweb.com'
    content Hash.new(
      'h1' => 'Factory H1',
      'h2' => 'Factory H2',
      'h3' => 'Factory H3'
    )
  end
end
