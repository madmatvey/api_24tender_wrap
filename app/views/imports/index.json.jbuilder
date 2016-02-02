json.array!(@imports) do |import|
  json.extract! import, :id, :import_time, :import_id
  json.url import_url(import, format: :json)
end
