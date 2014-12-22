json.array!(@advertises) do |advertise|
  json.extract! advertise, :id, :name, :text
  json.url advertise_url(advertise, format: :json)
end
