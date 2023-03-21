FactoryBot.define do
  factory :team do
    association :user
    
    
    team_name {Faker::Name.name}
    name {Faker::Name.name}
    introduction {Faker::Lorem.paragraph}
    area_id {Faker::Number.between(from: 2, to: 49)}
    owner_id{user_id}
    

    after(:build) do |team|
      team.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end