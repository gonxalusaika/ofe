# ruby encoding: utf-8
def icono(nombre)
	File.new("test/fixtures/iconos/#{nombre}.png")
end

triasico 			= Periodo.create(nombre: 'Triásico')
jurasico 			= Periodo.create(nombre: 'Jurásico')
cretacico 		= Periodo.create(nombre: 'Cretácico')

ankylosaurus 	= Dinosaurio.create(nombre: "Ankylosaurus",	 	periodo: cretacico, icono: icono("ankylosaurus"), descripcion: "Se distinguía por su pesada armadura y un gran mazo caudal, siendo probablemente el más grande de su grupo.")
carnotaurus 		= Dinosaurio.create(nombre: "Carnotaurus",	periodo: cretacico, icono: icono("carnotaurus"), 	descripcion: "Lo más notable de este dinosaurio son sus dos pequeños cuernos sobre los ojos en su pequeña cabeza, siendo el primer carnívoro que mostrara esta característica. También se hallaron impresiones de la piel que presentaban pequeños escudos óseos.")
oviraptor 		= Dinosaurio.create(nombre: "Oviraptor", 			periodo: cretacico, icono: icono("oviraptor"), 		descripcion: "Al contrario de lo que el nombre sugiere, Oviraptor no se alimentaba de huevos. Sus fósiles se hallaron cerca de un nido que se asumió que estaba atacando, pero estudios revelaron posteriormente que el nido pertenecía, de hecho, a Oviraptor.")
puertasaurus 	= Dinosaurio.create(nombre: "Puertasaurus",		periodo: cretacico, icono: icono("puertasaurus"), descripcion: "Puertasaurus fue en su tiempo, quizás el saurópodo más grande del mundo ya que medía entre 35 y 40 metros de largo y pesaba entre 80 a 100 toneladas.1 La segunda vértebra dorsal, encontrada en la provincia Argentina de Santa Cruz al sur del país, mide 168 centímetros de ancho y 106 de alto.")
raptor 				= Dinosaurio.create(nombre: "Raptor", 				periodo: cretacico, icono: icono("raptor"), 			descripcion: "Los descubrimientos de Sinornithosaurus y Microraptor en China y de Bambiraptor en Estados Unidos, parecen indicar que los dromeosáuridos son los dinosaurios más estrechamente emparentados con las aves.")
stygimoloch 	= Dinosaurio.create(nombre: "Stygimoloch",	 	periodo: cretacico, icono: icono("stygimoloch"), 	descripcion: "Se cree que Stygimoloch vivía en manadas. Tenía las patas delanteras cortas y las traseras largas, y una cola larga para mantener el equilibrio. Poseía en la cabeza unos cuernos que le servían para impresionar.")
styracosaurus = Dinosaurio.create(nombre: "Styracosaurus",	periodo: cretacico, icono: icono("styracosaurus"),descripcion: " Los Styracosaurus tenían cuatro piernas robustas y una cola corta. El cráneo tenía un pico y molares de corte alineadas en baterías dentales continuas, lo que sugiere que este animal cortaba las plantas en rodajas.")
tapejara 			= Dinosaurio.create(nombre: "Tapejara", 			periodo: cretacico, icono: icono("tapejara"), 		descripcion: "Tapejara vivía en la orilla de los lagos o en islas interiores, y es probable que fueran voladores lentos y no recorriesen grandes distancias. Se alimentaban fundamentalmente de peces.")
tyrannosaurus = Dinosaurio.create(nombre: "Tyrannosaurus",	periodo: cretacico, icono: icono("tyrannosaurus"),descripcion: "Con relación con sus largos y poderosos miembros traseros, los miembros superiores del Tyrannosaurus eran pequeños, pero inusualmente fuertes para su tamaño, y terminaban en dos dedos con garras.")
cryolophosaurus = Dinosaurio.create(nombre: "Cryolophosaurus",periodo: jurasico,icono: icono("cryolophosaurus"),descripcion: "")
bracciosaurus = Dinosaurio.create(nombre: "Bracciosaurus",	periodo: jurasico, 	icono: icono("bracciosaurus"),descripcion: "")


pAnylo 	= Pregunta.create(contenido: "Pregunta sobre el Ankylosaurus", 					dinosaurio: ankylosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pAnkylo2= Pregunta.create(contenido: "Otra regunta sobre el Ankylosaurus", 			dinosaurio: ankylosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: true },{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pOvi 		= Pregunta.create(contenido: "Pregunta sobre el Oviraptor", 						dinosaurio: oviraptor, 			respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: true },{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pOvi2 	= Pregunta.create(contenido: "Otra pregunta sobre el Oviraptor", 				dinosaurio: oviraptor, 			respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: true },{contenido:"Respuesta 4", es_correcta: false}]))
pCarno 	= Pregunta.create(contenido: "Pregunta sobre el Carnotaurus", 					dinosaurio: carnotaurus, 		respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: true },{contenido:"Respuesta 4", es_correcta: false}]))
pPuerta = Pregunta.create(contenido: "Pregunta sobre el Puertasaurus", 					dinosaurio: puertasaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: true }]))
pRaptor = Pregunta.create(contenido: "Pregunta sobre el Raptor", 								dinosaurio: raptor, 				respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pStygi  = Pregunta.create(contenido: "Pregunta sobre el Stygimoloch", 					dinosaurio: stygimoloch, 		respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: true },{contenido:"Respuesta 4", es_correcta: false}]))
pTape		= Pregunta.create(contenido: "Pregunta sobre el Tapejara", 							dinosaurio: tapejara, 			respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: true }]))
pTyra		= Pregunta.create(contenido: "Pregunta sobre el Tyrannosaurus", 				dinosaurio: tyrannosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pTyra2  = Pregunta.create(contenido: "Otra pregunta sobre el Tyrannosaurus", 		dinosaurio: tyrannosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pTyra3  = Pregunta.create(contenido: "Una pregunta mas sobre el Tyrannosaurus", dinosaurio: tyrannosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: true },{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))

Recorrido.create(nombre: "Recorrido de prueba", estacions: Estacion.create([
	{indice: 1, dinosaurio: ankylosaurus, preguntas: [pAnylo]},
	{indice: 2, dinosaurio: tyrannosaurus, preguntas: [pTyra2, pTyra3]},
	{indice: 3, dinosaurio: raptor, preguntas: [pRaptor]},
	{indice: 4, dinosaurio: carnotaurus, preguntas: [pCarno]},
	{indice: 5, dinosaurio: stygimoloch, preguntas: [pStygi]},
	] ))

Recorrido.create(nombre: "Otro recorrido de prueba", estacions: Estacion.create([
	{indice: 1, dinosaurio: ankylosaurus, preguntas: [pAnylo]},
	{indice: 2, dinosaurio: tyrannosaurus, preguntas: [pTyra2, pTyra3]},
	{indice: 3, dinosaurio: raptor, preguntas: [pRaptor]},
	{indice: 4, dinosaurio: carnotaurus, preguntas: [pCarno]},
	{indice: 5, dinosaurio: stygimoloch, preguntas: [pStygi]},
	] ))