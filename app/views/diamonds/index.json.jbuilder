json.array!(@diamonds) do |diamond|
  json.extract! diamond, :id, :weight, :color, :clarity, :treatment, :shape, :condgirdle, :condculet, :sizeculet, :conditioncut, :length, :width, :weight, :height, :description
  json.url diamond_url(diamond, format: :json)
end
