json.array!(@sections) do |section|
  json.extract! section, :name, :content, :checked
  json.url section_url(section, format: :json)
end
