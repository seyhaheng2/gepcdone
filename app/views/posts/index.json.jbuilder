json.array!(@posts) do |post|
  json.extract! post, :id, :name, :image, :description, :viewer
  json.url post_url(post, format: :json)
end
