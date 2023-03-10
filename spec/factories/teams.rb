FactoryBot.define do
  factory :team do

    
    
    team_name {Faker::Name.name}
    name {Faker::Name.name}
    introduction {Faker::Lorem.paragraph}
    area_id {Faker::Number.between(from: 2, to: 49)}
    owner_id{Faker::Number.number}
    

    after(:build) do |team|
      team.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end