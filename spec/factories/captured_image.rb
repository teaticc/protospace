FactoryGirl.define do
  factory :captured_image, class: CapturedImage do
    img_type 0
    img_url { File.open(File.join(Rails.root, 'spec/images/sample.png')) }
  end
end
