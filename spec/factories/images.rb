include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    prototype
    image { fixture_file_upload("spec/fixtures/img/sample.jpg")}

    trait :main_image do
      status :main
    end

    trait :sub_image do
      status :sub
    end
  end
end
