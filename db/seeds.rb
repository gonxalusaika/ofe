# ruby encoding: utf-8
def icono(nombre)
	File.new("test/fixtures/iconos/#{nombre}.png")
end

usuarioAdmin = User.create(first_name: 'admin', last_name: 'admin', password: 'admin', email: 'admin@admin.com')


triasico 			= Periodo.create(nombre: 'Triásico')
jurasico 			= Periodo.create(nombre: 'Jurásico')
cretacico 		= Periodo.create(nombre: 'Cretácico')

ankylosaurus 		= Dinosaurio.create(nombre: "Ankylosaurus",	 	periodo: cretacico, icono: icono("ankylosaurus"), 
	descripciones: Descripcion.create([
	{contenido: "Se distinguía por su pesada armadura y un gran mazo caudal, siendo probablemente el más grande de su grupo."},
	{contenido: "De acuerdo a algunos científicos, Ankylosaurus alcanzó entre los 8 y 9 metros de longitud,2 y debió pesar alrededor de las 6 toneladas,3 siendo uno de los anquilosaurianos más grandes que se conoce."},
	{contenido: "La característica más distintiva del Ankylosaurus es su armadura, la cual consiste en grandes protuberancias y placas óseas llamadas osteodermos, incrustadas en la piel. En la piel de cocodrilos, armadillos y algunos lagartos, también se pueden identificar osteodermos hoy en día."},
	{contenido: "Conocido por una sola especie que vivió a finales del período Cretácico, hace aproximadamente 68 a 66 millones de años, durante el Mastrichtiano, en lo que hoy es Norteamérica."},
	]))
carnotaurus 		= Dinosaurio.create(nombre: "Carnotaurus",	periodo: cretacico, 	icono: icono("carnotaurus"), 	
	descripciones: Descripcion.create([
		{contenido: "Lo más notable de este dinosaurio son sus dos pequeños cuernos sobre los ojos en su pequeña cabeza, siendo el primer carnívoro que mostrara esta característica. También se hallaron impresiones de la piel que presentaban pequeños escudos óseos."}
		]))
oviraptor 			= Dinosaurio.create(nombre: "Oviraptor", 			periodo: cretacico, icono: icono("oviraptor"), 		
	descripciones: Descripcion.create([
		{contenido: "Al contrario de lo que el nombre sugiere, Oviraptor no se alimentaba de huevos. Sus fósiles se hallaron cerca de un nido que se asumió que estaba atacando, pero estudios revelaron posteriormente que el nido pertenecía, de hecho, a Oviraptor."},
		{contenido: "Oviraptor era un dinosaurio no aviano similar a las aves, que medía alrededor de 2 metros de largo, 1 de alto y de peso 11 kilogramos"},
		{contenido: "Vivió a finales del período Cretácico, hace aproximadamente 75 millones de años, en el Campaniano, en lo que hoy es Asia."}
		]))
puertasaurus 		= Dinosaurio.create(nombre: "Puertasaurus",		periodo: cretacico, icono: icono("puertasaurus"), 
	descripciones: Descripcion.create([
		{contenido: "Puertasaurus fue en su tiempo, quizás el saurópodo más grande del mundo ya que medía entre 35 y 40 metros de largo y pesaba entre 80 a 100 toneladas.1 La segunda vértebra dorsal, encontrada en la provincia Argentina de Santa Cruz al sur del país, mide 168 centímetros de ancho y 106 de alto."},
		{contenido: "Vivió a finales del período Cretácico, hace aproximadamente 71 y 65 millones de años, en el Mastrichtiano, en lo que es hoy Sudamérica"},
		{contenido: "El descubrimiento de cuatro vértebras del cuello y el lomo del Puertasaurus, hecho en enero de 2001 en la estancia Santa Teresita, en la zona del Lago Viedma, en la Patagonia, Argentina."},
		{contenido: "El diagnóstico de Puertasaurus se basa en las siguientes características: tamaño gigante, la espina neural cervical considerablemente inflada, siendo transversalmente más ancho que el centro vertebral y teniendo fuertes cantos en dorso-lateral"}
		]))
raptor 					= Dinosaurio.create(nombre: "Raptor", 				periodo: cretacico, icono: icono("raptor"), 			
	descripciones: Descripcion.create([
		{contenido: "vivieron durante el Campaniano, hacia finales del período Cretácico, hace unos 75 a 71 millones de años, en lo que es hoy Asia."},
		{contenido: "Los descubrimientos de Sinornithosaurus y Microraptor en China y de Bambiraptor en Estados Unidos, parecen indicar que los dromeosáuridos son los dinosaurios más estrechamente emparentados con las aves."},
		{contenido: "Fue un carnívoro bípedo, con una cola larga y rígida, y tres garras, una alargada y curva en cada pata, la cual usaba para matar a sus presas. A diferencia de otros dromeosáuridos Velociraptor poseía un cráneo bajo y alargado, y un hocico chato, dirigido hacia arriba."},
		{contenido: "Poseía patas traseras de gran longitud, lo que expresa (al igual que el nombre) su aparente gran velocidad. Era relativamente pequeño, los adultos alcanzaban una longitud de 1,8 m, y aproximadamente 0,5 metros de altura a la cadera, pesando cerca de 15 kg."}
		]))
stygimoloch 		= Dinosaurio.create(nombre: "Stygimoloch",	 	periodo: cretacico, icono: icono("stygimoloch"), 	
	descripciones: Descripcion.create([
		{contenido: "Se cree que Stygimoloch vivía en manadas. Tenía las patas delanteras cortas y las traseras largas, y una cola larga para mantener el equilibrio. Poseía en la cabeza unos cuernos que le servían para impresionar."},
		{contenido: "Vivió en el Cretácico superior, hace aproximadamente 65.5 millones de años, en el Mastrichtiano, en lo que hoy es Norteamérica."},
		{contenido: "Su cráneo tenía un espesor de unos 25 centímetros. Medía alrededor de 3 metros de longitud y 2 de altura. Tenía 4 dedos en las extremidades delanteras y los pies. Era un paquicefalosáurido relativamente grande, con el cráneo midiendo cerca de 46 centímetros de largo"}
		]))
styracosaurus 	= Dinosaurio.create(nombre: "Styracosaurus",	periodo: cretacico, icono: icono("styracosaurus"),
	descripciones: Descripcion.create([
		{contenido: "Los Styracosaurus tenían cuatro piernas robustas y una cola corta. El cráneo tenía un pico y molares de corte alineadas en baterías dentales continuas, lo que sugiere que este animal cortaba las plantas en rodajas."},
		{contenido: "Relativamente grande, llegando a alcanzar los 6 metros de largo y pesando cerca de 3 toneladas. Alcanzó casi los 2 metros de altura."}
		]))
tapejara 				= Dinosaurio.create(nombre: "Tapejara", 			periodo: cretacico, icono: icono("tapejara"), 			
	descripciones: Descripcion.create([
		{contenido: "Tapejara vivía en la orilla de los lagos o en islas interiores, y es probable que fueran voladores lentos y no recorriesen grandes distancias. Se alimentaban fundamentalmente de peces."},
		{contenido: "Vivió en del Cretácico, hace 108 millones de años. Se han encontrado esqueletos perfectamente conservados en la Formación Santana, en Brasil."}
		]))
tyrannosaurus 	= Dinosaurio.create(nombre: "Tyrannosaurus",	periodo: cretacico, icono: icono("tyrannosaurus"),	
	descripciones: Descripcion.create([
		{contenido: "Con relación con sus largos y poderosos miembros traseros, los miembros superiores del Tyrannosaurus eran pequeños, pero inusualmente fuertes para su tamaño, y terminaban en dos dedos con garras."},
		{contenido: "Vivió a finales del período Cretácico, hace aproximadamente entre 67 y 66 millones de años,2 en el Maastrichtiano, en lo que es hoy Norteamérica occidental, con una distribución mucho más amplia que otros tiranosáuridos."},
		{contenido: "Es el mayor tiranosáurido conocido y uno de los mayores depredadores conocidos de la Tierra, midiendo hasta 12,3 metros de largo,3 4 metros de altura hasta las caderas,4 y con pesos estimados entre 6 a 8 toneladas."},
		{contenido: "Durante mucho tiempo fue el mayor carnívoro de su ecosistema, debió haber sido el superpredador, cazando hadrosáuridos y ceratópsidos, aunque algunos expertos han sugerido que era principalmente carroñero."}
		]))
cryolophosaurus = Dinosaurio.create(nombre: "Cryolophosaurus",periodo: jurasico,	icono: icono("cryolophosaurus"),
	descripciones: Descripcion.create([{contenido: ""}]))
bracciosaurus 	= Dinosaurio.create(nombre: "Bracciosaurus",	periodo: jurasico, 	icono: icono("bracciosaurus"),	
	descripciones: Descripcion.create([{contenido: ""}]))


pAnylo = Pregunta.create(contenido: "¿Qué comía el Ankylosaurus?", dinosaurio: ankylosaurus, respuestas: Respuesta.create([
	{contenido: "Plantas", es_correcta: true, feedback: "Sus dientes tenían la forma perfecta para cortar hojas."},
	{contenido: "Personas", es_correcta: false, feedback: "Feedback de Personas."},
	{contenido: "Carne", es_correcta: false, feedback: "Feedback de Carne"},
	{contenido: "Hamburguesas", es_correcta: false, feedback: "Feedback de Hamburguesas"}]))
pAnkylo2 = Pregunta.create(contenido: "¿Cómo se defendía el Ankylosaurus?", dinosaurio: ankylosaurus, respuestas: Respuesta.create([
	{contenido: "Con su armadura y su cola-mazo ", es_correcta: false, feedback: "La armadura y el mazo que está hecha de placas de hueso que se llaman osteodermos."},
	{contenido: "Rasguñando", es_correcta: true, feedback: "Feedback de Rasguñando"},
	{contenido: "Mordiendo", es_correcta: false, feedback: "Feedback de Mordiendo"},
	{contenido: "No se defendía. Huía", es_correcta: false, feedback: "Feedback de No se defendía, huía"}]))
pAnkylo3 = Pregunta.create(contenido: "¿Cuanto medía de largo el Ankylosaurus? ", dinosaurio: ankylosaurus, respuestas: Respuesta.create([
	{contenido: "9 m", es_correcta: false, feedback: "Feedback de 9 m"},
	{contenido: "20 m", es_correcta: true, feedback: "Feedback de 20 m"},
	{contenido: "2 m", es_correcta: false, feedback: "Feedback de 2 m"},
	{contenido: "1 m", es_correcta: false, feedback: "Feedback de 1 m"}]))
pAnkylo4 = Pregunta.create(contenido: "¿Cuanto pesaba el Ankylosaurus? ", dinosaurio: ankylosaurus, respuestas: Respuesta.create([
	{contenido: "1 toneladas", es_correcta: false, feedback: "Feedback de 1 toneladas"},
	{contenido: "96 toneladas", es_correcta: true, feedback: "Feedback de 96 toneladas"},
	{contenido: "200 toneladas", es_correcta: false, feedback: "Feedback de 200 toneladas"},
	{contenido: "6 toneladas", es_correcta: false, feedback: "Feedback de 6 toneladas"}]))
pCarno 	= Pregunta.create(contenido: "¿Que comía el Carnotaurus?", dinosaurio: carnotaurus, respuestas: Respuesta.create([
	{contenido: "Carne", 	es_correcta: false, feedback: "Feedback de Carne"},
	{contenido:"Verduras", 	es_correcta: false, feedback: "Feedback de Verduras"},
	{contenido:"Pollo", 	es_correcta: true , feedback: "Feedback de Pollo"},
	{contenido:"No comía", 	es_correcta: false, feedback: "Feedback de No comía"}]))
pCarno2	= Pregunta.create(contenido: "¿Por qué el nombre Carnotaurus?", dinosaurio: carnotaurus, respuestas: Respuesta.create([
	{contenido: "Por su carácter", 	es_correcta: false, feedback: "Feedback de Por su carácter"},
	{contenido: "Por su cola", 	es_correcta: false, feedback: "Feedback de Por su cola"},
	{contenido: "Por sus cuernos", 	es_correcta: true , feedback: "Feedback de Por sus cuernos"},
	{contenido: "Por su tamaño", 	es_correcta: false, feedback: "Feedback de Por su tamaño"}]))

pOvi 		= Pregunta.create(contenido: "Pregunta sobre el Oviraptor", 						dinosaurio: oviraptor, 			respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: true },{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pOvi2 	= Pregunta.create(contenido: "Otra pregunta sobre el Oviraptor", 				dinosaurio: oviraptor, 			respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: true },{contenido:"Respuesta 4", es_correcta: false}]))
pPuerta = Pregunta.create(contenido: "Pregunta sobre el Puertasaurus", 					dinosaurio: puertasaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: true }]))
pRaptor = Pregunta.create(contenido: "Pregunta sobre el Raptor", 								dinosaurio: raptor, 				respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pStygi  = Pregunta.create(contenido: "Pregunta sobre el Stygimoloch", 					dinosaurio: stygimoloch, 		respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: true },{contenido:"Respuesta 4", es_correcta: false}]))
pStyra  = Pregunta.create(contenido: "Pregunta sobre el Styracosaurus", 				dinosaurio: styracosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: true },{contenido:"Respuesta 4", es_correcta: false}]))
pTape		= Pregunta.create(contenido: "Pregunta sobre el Tapejara", 							dinosaurio: tapejara, 			respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: true }]))
pTyra		= Pregunta.create(contenido: "Pregunta sobre el Tyrannosaurus", 				dinosaurio: tyrannosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pTyra2  = Pregunta.create(contenido: "Otra pregunta sobre el Tyrannosaurus", 		dinosaurio: tyrannosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: true },{contenido:"Respuesta 2", es_correcta: false},{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))
pTyra3  = Pregunta.create(contenido: "Una pregunta mas sobre el Tyrannosaurus", dinosaurio: tyrannosaurus, 	respuestas: Respuesta.create([{contenido: "Respuesta 1", es_correcta: false},{contenido:"Respuesta 2", es_correcta: true },{contenido:"Respuesta 3", es_correcta: false},{contenido:"Respuesta 4", es_correcta: false}]))

recorrido = Recorrido.create(nombre: "Recorrido de prueba", estacions: Estacion.create([
	{indice: 1, 	dinosaurio: ankylosaurus, 	preguntas: [pAnylo]},
	{indice: 3, 	dinosaurio: tyrannosaurus, 	preguntas: [pTyra2, pTyra3]},
	{indice: 4, 	dinosaurio: raptor, 				preguntas: [pRaptor]},
	{indice: 6, 	dinosaurio: carnotaurus, 		preguntas: [pCarno]},
	{indice: 17, 	dinosaurio: stygimoloch, 		preguntas: [pStygi]},
	{indice: 20, 	dinosaurio: puertasaurus, 	preguntas: [pPuerta]},
	{indice: 5, 	dinosaurio: oviraptor, 			preguntas: [pOvi, pOvi2]},
	{indice: 2, 	dinosaurio: styracosaurus, 	preguntas: [pStyra]}
	] ))

Pregunta.all do |pregunta|
	150.times do
		ResultadoPregunta.create(pregunta: pregunta, respuesta: pregunta.respuestas[rand(4)])
	end
end