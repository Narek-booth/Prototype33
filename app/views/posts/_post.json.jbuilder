json.extract! post, :id, :owner, :cause, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
