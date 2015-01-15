FactoryGirl.define do

  factory :page do
    body {Faker::Lorem.paragraph}
  end

end
