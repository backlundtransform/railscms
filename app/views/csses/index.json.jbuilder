json.array!(@csses) do |css|
  json.extract! css, :color, :background
  json.url css_url(css, format: :json)
end
