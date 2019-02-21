FactoryBot.define do
  factory :address do
    street {Faker::Address.city}
    city {Faker::Address.street_name}
    zip_code {Faker::Address.zip_code}
  end
end
