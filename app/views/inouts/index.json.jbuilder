json.array!(@inouts) do |inout|
  json.extract! inout, :id, :name
  json.url inout_url(inout, format: :json)
end
