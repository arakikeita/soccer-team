FactoryBot.define do
  factory :attend do
    association :user
    association :calender

    attendance_id {Faker::Number.between(from: 1, to: 3)}



    
  end
end
