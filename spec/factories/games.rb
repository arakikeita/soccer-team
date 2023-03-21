FactoryBot.define do
  factory :game do
    association :user
    association :team

    title {Faker::Name.name}
    content {Faker::Lorem.paragraph}
    place{Faker::Name.name}
    start_time{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    end_time{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}

    after(:build) do |game|
      game.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
