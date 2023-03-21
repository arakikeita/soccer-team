FactoryBot.define do
  factory :calender do
    association :user
    association :team

    title {Faker::Name.name}
    content {Faker::Lorem.paragraph}
    start_time{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    end_time{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}




  end
end
