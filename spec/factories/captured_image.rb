FactoryGirl.define do
  factory :captured_image, class: CapturedImage do
    img_type "main"
    img_url { File.open(File.join(Rails.root, 'spec/images/sample.png')) }

    trait :with_txt_file do
      after(:build) do |captured_image|
        captured_image.img_url = File.open(File.join(Rails.root, 'spec/images/bad.txt'))
      end
    end

  end
end
