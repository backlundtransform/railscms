json.array!(@sites) do |site|
  json.extract! site, :title, :user_id
  json.url site_url(site, format: :json)
end
