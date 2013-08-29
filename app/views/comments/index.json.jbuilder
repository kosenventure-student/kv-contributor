json.array!(@comments) do |comment|
  json.extract! comment, :user_id_id, :post_id_id, :content
  json.url comment_url(comment, format: :json)
end
