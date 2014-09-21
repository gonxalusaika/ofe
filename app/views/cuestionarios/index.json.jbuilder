json.array!(@cuestionarios) do |cuestionario|
  json.extract! cuestionario, :id, :nombre, :preguntas
  json.url cuestionario_url(cuestionario, format: :json)
end
