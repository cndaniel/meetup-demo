json.id meetup.id
json.title meetup.title
json.descripition meetup.descripition
json.user do
  email user.email
end
json.comments do |comment|
  content comment.content
  repliant comment.user
end
