json.array!(@colordiamonds) do |colordiamond|
  json.extract! colordiamond, :id, :weight, :color, :clarity, :treatment, :shape, :condgirdle, :condculet, :sizeculet, :conditioncut, :length, :width, :weight, :height, :description, :intensitecolor, :bycolor1, :bycolor2, :diamondcertificate
  json.url colordiamond_url(colordiamond, format: :json)
end
