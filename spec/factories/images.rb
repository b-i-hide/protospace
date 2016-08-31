FactoryGirl.define do
  factory :image do
    prototype
    image { fixture_file_upload("spec/fixtures/img/sample.jpg")}

    trait :main do
      status :main
    end

    trait :sub do
      status :sub
    end
  end
end
