FactoryBot.define do
  factory :user_team do
    association :user
    association :team

    user_id{Faker::Number.number}
    team_id{Faker::Number.number}
    
  end
end
