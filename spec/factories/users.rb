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
      after(:build) do |user|
        3.times do
          user.comments << FactoryGirl.build(:comment)
        end
      end
    end
  end

  trait :with_prototype do
    after(:build) do |user|
      user.prototypes << FactoryGirl.build(:prototype, :with_main_image)
    end
  end

  factory :other_user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    password "123456"
    password_confirmation "123456"

    trait :with_other_prototype do
      after(:build) do |user|
        user.prototypes << FactoryGirl.create(:other_prototype)
      end
    end
  end

end
