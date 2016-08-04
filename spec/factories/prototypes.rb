FactoryGirl.define do
  factory :prototype, class: Prototype do
    title Faker::App.name
    copy Faker::Lorem.word
    concept Faker::Lorem.sentence

    trait :with_main_image do
      after(:build) do |prototype|
        prototype.captured_images << FactoryGirl.build(:captured_image)
      end
    end

    trait :with_full_images do
      after(:build) do |prototype|
        prototype.captured_images << FactoryGirl.build(:captured_image)
        3.times do
          prototype.captured_images << FactoryGirl.build(:captured_image, img_type: "sub")
        end
      end
    end

    trait :with_two_main_images do
      after(:build) do |prototype|
        2.times do
          prototype.captured_images << FactoryGirl.build(:captured_image)
        end
      end
    end

    trait :with_goods do
      after(:build) do |prototype|
        3.times do
          prototype.goods << FactoryGirl.build(:good)
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

  factory :other_prototype, class: Prototype do
    title Faker::App.name
    copy Faker::Lorem.word
    concept Faker::Lorem.sentence

    with_main_image

    trait :with_main_image do
      after(:build) do |prototype|
        prototype.captured_images << FactoryGirl.build(:captured_image)
      end
    end
  end

end
