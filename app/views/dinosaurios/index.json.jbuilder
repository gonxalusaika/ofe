json.array!(@dinosaurios) do |dinosaurio|
  json.extract! dinosaurio, :id, :nombre, :descripcion, :periodo
  json.url dinosaurio_url(dinosaurio, format: :json)
end
