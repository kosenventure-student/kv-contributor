json.array!(@works) do |work|
  json.extract! work, :title, :user_id_id, :content, :url
  json.url work_url(work, format: :json)
end
