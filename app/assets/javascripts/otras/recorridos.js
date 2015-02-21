// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


//= require otras/angular.min
//= require otras/angular-resource.min
//= require otras/ui-bootstrap-custom-tpls-0.10.0
//= require otras/toastr.min

var app = angular.module('EstacionesMngr', ['ngResource','ui.bootstrap'])
	.filter('truncar', function(){
		return function (text, length) {
			if (isNaN(length)){
        length = 150;
      }
      var end = "...";
      if (text.length <= length || text.length - end.length <= length) {
          return text;
      }
      else {
          return String(text).substring(0, length-end.length) + end;
      }
  }
	})
	.factory('Dinosaurios', ['$resource', function($resource){
		return $resource('/api/dinosaurios/:metodo.json', {}, {
			todos: {method:'GET', params:{}, isArray:true}
		});
	}])
	.factory('Recorridos', ['$resource', function($resource){
		return $resource('/api/recorridos/:metodo/:id', {},{
			todos: {method: 'GET', params:{}, isArray:true},
			get: 	 {method: 'GET', params:{}, isArray:false},
			nuevo: {method: 'POST', params:{metodo: 'create'}, isArray:false},
			editar: {method: 'POST', params:{metodo: 'update'}, isArray:false}
		})
	}])
	.factory('Preguntas', ['$resource', function($resource){
		return $resource('/api/preguntas/:metodo/:id.json', {},{
			todos: {method: 'GET', params:{}, isArray: true}
		})
	}])
	.controller('estacionesController', ['$scope', '$location', 'Recorridos', 'Dinosaurios', 'Preguntas', function($scope, $location, Recorridos, Dinosaurios, Preguntas){
		toastr.options = {
		  "closeButton": true,
		  "positionClass": "toast-bottom-right"
		};

		$scope.infoLoader = "Cargando la información necesaria. Por favor, espere...";
		$('.loader-cover').show();
		$scope.dinosaurios = Dinosaurios.todos({}, 
			function(res){
				$scope.inicializarRecorrido();
				$('.loader-cover').hide();
			}, 
			function(err){$('.loader-cover').hide();});
		$scope.preguntas = Preguntas.todos();

		$scope.cambiarEstacionSeleccionada = function(estacion){
			$scope.estacionSeleccionada = estacion;
		}
		$scope.asignarDino = function(dinosaurio, estacion){
			estacion.dinosaurio = dinosaurio;
			estacion.preguntas = [];
		}
		$scope.toggleSeleccionPregunta = function(pregunta){
			var index = $scope.estacionSeleccionada.preguntas.indexOf(pregunta);
			if(index > -1)
				$scope.estacionSeleccionada.preguntas.splice(index, 1);
			else
				$scope.estacionSeleccionada.preguntas.push(pregunta);
		}
		$scope.registrarRecorrido = function(){
			if($scope.validarRecorrido()){
				$scope.infoLoader = "Registrando recorrido. Por favor, espere...";
				$('.loader-cover').show();
				$scope.recorrido.estacions_attributes = {};
				for(var i=0; i<$scope.recorrido.estaciones.length;i++){
					var preguntas = [];
					for(var j=0; j<$scope.recorrido.estaciones[i].preguntas.length; j++){
						preguntas.push($scope.recorrido.estaciones[i].preguntas[j].id);
					}
					$scope.recorrido.estacions_attributes[i] = 
						{id: $scope.recorrido.estaciones[i].id, indice: $scope.recorrido.estaciones[i].codigo, 
							dinosaurio_id: $scope.recorrido.estaciones[i].dinosaurio.id,
							pregunta_ids: preguntas};
				}
				console.log($scope.recorrido);
				if($scope.recorrido.id == undefined ){
					Recorridos.nuevo({id: $scope.recorrido.id,recorrido:$scope.recorrido},
						function(res){
							window.location.href = '/recorridos/'+res.id;
						},
						function(err){
							$('.loader-cover').hide();
							alert('Ocurrió un error al intentar registrar el recorrido');
						});
				}
				else{
					Recorridos.editar({id: $scope.recorrido.id, recorrido:$scope.recorrido},
						function(res){
							window.location.href = '/recorridos/'+res.id;
						},
						function(err){
							$('.loader-cover').hide();
							alert('Ocurrió un error al intentar registrar el recorrido');
						});
				}
			}
		}
		$scope.validarRecorrido = function(){
			if($scope.recorrido.nombre == null || $scope.recorrido.nombre.length == 0){
				toastr.error("Debe ingresar un nombre para el recorrido.", "Error");
				return false;
			}
			else {
				for(var i=0; i<$scope.recorrido.estaciones.length; i++){
					var estacionActual = $scope.recorrido.estaciones[i];
					if(estacionActual.dinosaurio == null){
						toastr.error("Todas las estaciones deben tener un dinosaurio asignado.", "Error");
						return false;
					}
					if(estacionActual.preguntas.length == 0){
						toastr.error("Todas las estaciones deben tener al menos una pregunta.", "Error");
						return false;
					}
				}
				return true;
			}
		}
		$scope.inicializarRecorrido = function(){
			// $scope.dinosaurios = dinosaurios;
			// $scope.preguntas = preguntas;
			dinosaurios = undefined;
			preguntas = undefined;
			if(typeof recorrido !== 'undefined'){
				$scope.recorrido = {id: recorrido.id, nombre: recorrido.nombre, estaciones: [] };
				for(var i=0; i<recorrido.estacions.length; i++){
					var dinosaurio = $.grep($scope.dinosaurios, function(dino){
						return dino.id == recorrido.estacions[i].dinosaurio_id;
					})[0];
					var pregs = [];
					for(var j=0; j<recorrido.estacions[i].preguntas.length; j++){
						var preg = $.grep($scope.preguntas, function(pregunta){
							return recorrido.estacions[i].preguntas[j].id == pregunta.id;
						})[0];
						pregs.push(preg);
					}
					$scope.recorrido.estaciones.push(
						{id: recorrido.estacions[i].id, nombre: "Estacion " + (i+1), codigo:i+1, dinosaurio: dinosaurio, preguntas: pregs }
						);
				}
			}
			else{
				$scope.recorrido = {nombre: "",
					estaciones: [
						{nombre: "Estacion 1", codigo: 1, preguntas: []},
						{nombre: "Estacion 2", codigo: 3, preguntas: []},
						{nombre: "Estacion 3", codigo: 4, preguntas: []},
						{nombre: "Estacion 4", codigo: 6, preguntas: []},
						{nombre: "Estacion 5", codigo: 17, preguntas: []},
						{nombre: "Estacion 6", codigo: 20, preguntas: []},
						{nombre: "Estacion 7", codigo: 5, preguntas: []},
						{nombre: "Estacion 8", codigo: 2, preguntas: []}
					]
				}
			}
		}
		// $scope.inicializarRecorrido();
	}]);

function caete(ev) {
    ev.preventDefault();
}
