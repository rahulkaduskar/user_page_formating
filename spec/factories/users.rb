FactoryGirl.define do
  factory :user do
  	sequence(:name) {|n| "User #{n}" }  
  	sequence(:email) {|n| "user#{n}@test.com" } 
    password "password"
    password_confirmation  "password"
    association :stylesheet, factory: :stylesheet
  end
end
