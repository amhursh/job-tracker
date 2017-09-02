FactoryGirl.define do
  factory :job do
    sequence :title do |i|
      "jobtitle#{i}"
    end

    sequence :description do |i|
      "jobdescrip#{i}"
    end

    level_of_interest {rand(100)}

    company

    sequence :city do |i|
      "jobcity#{i}"
    end
  end
end
