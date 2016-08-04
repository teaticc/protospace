FactoryGirl.define do
  factory :comment, class: Comment do
    comment Faker::Lorem.word
  end
end
