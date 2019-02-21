FactoryBot.define do
  factory :customer do
    name {Faker::Name.name}
    association :address, factory: :address
  end
end
