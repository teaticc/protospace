FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password "123456"
    password_confirmation "123456"

    trait :with_goods do
      after(:build) do |user|
        3.times do
          user.goods << FactoryGirl.build(:good)
        end
      end
    end

    trait :with_comments do
      after(:build) do |prototype|
        3.times do
          prototype.comments << FactoryGirl.build(:comment)
        end
      end
    end
  end

  factory :other_user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    password "123456"
    password_confirmation "123456"
  end

end
