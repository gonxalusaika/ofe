json.array!(@periodos) do |periodo|
  json.extract! periodo, :id, :nombre, :descripcion
  json.url periodo_url(periodo, format: :json)
end
