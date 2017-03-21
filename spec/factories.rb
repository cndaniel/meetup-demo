FactoryGirl.define do
  factory :meetup_relationship do
    
  end
  factory :comment do
    
  end
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
