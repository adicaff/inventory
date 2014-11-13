FactoryGirl.define do
  factory :user do
    email 'koko@koko.com'
    password  'kokokoko'
  end

  factory :item do
    name 'Test Item'
    description 'Testing'
    ubication 'Test field'
  end
end