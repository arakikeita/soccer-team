FactoryBot.define do
  factory :comment do
    association :user
    association :team
    association :game

   
    content {Faker::Lorem.paragraph}
    

  end
end
