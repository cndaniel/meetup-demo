json.id meetup.id
json.title meetup.title
json.description meetup.description
json.user do
  email user.email
end
json.comments do |comment|
  content comment.content
  repliant comment.user
end
