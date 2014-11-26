json.array!(@colorgems) do |colorgem|
  json.extract! colorgem, :id, :gemstonetype, :color, :shape, :length, :height, :width, :weight, :gemscertificate
  json.url colorgem_url(colorgem, format: :json)
end
