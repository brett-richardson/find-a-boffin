# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    association :member
    association :target, factory: :member
  end
end
