FactoryGirl.define do
  sequence(:email){ |n| "user#{n}@example.com"}
  factory :user do
    email
    password "password"
    password_confirmation { password }

  end

  factory :meetup do
    title "Meetup title"
    description "description."
    user
  end
end
