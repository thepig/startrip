json.posts @posts do |json, post|
  json.(post, :id, :body, :created_at)
  json.photo_url post.photo.url

  json.user post.user, :id, :username, :email, :created_at
end
