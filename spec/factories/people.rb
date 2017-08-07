FactoryGirl.define do
  factory :person do
    name Faker::Name.name
    age Faker::Number.between(1, 65)
    oss_projects Faker::Number.between(0, 20)
  end
end
