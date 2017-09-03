FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "categorytitle#{i}"
    end
  end
end
