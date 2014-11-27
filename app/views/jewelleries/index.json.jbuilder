json.array!(@jewelleries) do |jewellery|
  json.extract! jewellery, :id, :title, :stone1, :stone2, :stone3, :material1, :material2, :material3, :description, :certificate, :companymade, :owner
  json.url jewellery_url(jewellery, format: :json)
end
