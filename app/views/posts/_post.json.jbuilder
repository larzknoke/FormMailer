json.extract! post, :id, :sender, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
