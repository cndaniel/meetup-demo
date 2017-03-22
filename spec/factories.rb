FactoryGirl.define do
  factory :meetup_relationship do

  end
  factory :comment do
    user
    meetup
    content "I am an awesome comment."
  end
  sequence(:email){ |n| "user#{n}@example.com"}
  factory :user do
    email
    password "password"
    password_confirmation { password }

  end

  factory :meetup do
    title "I am a handsome Meetup title"
    description "I am an useless description."
    user
  end
end
