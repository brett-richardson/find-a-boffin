# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    sequence( :name ){ |i| 'User #{i}' }
    website 'http://www.dablweb.com'
  end
end
