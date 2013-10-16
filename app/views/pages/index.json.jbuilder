json.array!(@pages) do |page|
  json.extract! page, :title, :meta_description, :site_id
  json.url page_url(page, format: :json)
end
