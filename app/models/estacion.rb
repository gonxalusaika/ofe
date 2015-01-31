class Estacion < ActiveRecord::Base
  belongs_to :dinosaurio
  belongs_to :recorrido
  has_and_belongs_to_many :preguntas

  validates :dinosaurio, presence: {message: "El dinosaurio no puede ser vacio"}
  validates_with ValidadorEstacion

  	# def coinciden_preguntas_dinosaurio?
  	# 	errores = 0
  	# 	preguntas.each do |pregunta|
  	# 		errores += 1 unless dinosaurio.id == pregunta.dinosaurio_id
  	# 	end
  	# 	errores == 0
  	# end

  def cargar_resultados
    preguntas.each do |pregunta|
      pregunta.respuestas.each do |respuesta|
        # resultados = ResultadoPregunta.where(recorrido: recorrido.id, pregunta: pregunta, respuesta: respuesta).count
        sql = "select count(1)
          from resultado_preguntas r_preg join resultado_recorridos r_rec on r_preg.resultado_recorrido_id = r_rec.id join
            recorridos recorrido on r_rec.recorrido_id = recorrido.id
          where recorrido.id = #{recorrido.id} and r_preg.pregunta_id = #{pregunta.id} and r_preg.respuesta_id = #{respuesta.id}"
        respuesta.cantidad_elegida = ActiveRecord::Base.connection.execute(sql)[0]["count"].to_i
        # respuesta.cantidad_elegida = resultados
      end
    end
  end

end