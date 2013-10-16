json.array!(@layouts) do |layout|
  json.extract! layout, :title
  json.url layout_url(layout, format: :json)
end
