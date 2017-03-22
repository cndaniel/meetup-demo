json.id meetup.id
json.title meetup.title
json.description meetup.description
json.user meetup.user.email
json.comments meetup.comments do |comment|
  json.content comment.content
  json.repliant comment.user.email
end
