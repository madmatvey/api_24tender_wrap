json.array!(@imports) do |import|
  json.extract! import, :id, :time_to, :time_from
  json.url import_url(import, format: :json)
end
