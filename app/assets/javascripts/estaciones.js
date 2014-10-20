// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var app = angular.module('EstacionesMngr', ['ngResource','ui.bootstrap'])
	.filter('truncar', function(){
		return function (text, length) {
			if (isNaN(length))
                length = 150;

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
			nuevo: {method: 'POST', params:{metodo: 'create'}, isArray:false}
		})
	}])
	.controller('estacionesController', ['$scope', 'Dinosaurios', 'Recorridos', function($scope, Dinosaurios, Recorridos){
		$scope.dinosaurios = Dinosaurios.todos();

		$scope.recorrido = {nombre: ""};
		$scope.recorrido.estaciones = [
			{nombre: "Estacion 1", codigo: 1},
			{nombre: "Estacion 2", codigo: 2},
			{nombre: "Estacion 3", codigo: 3},
			{nombre: "Estacion 4", codigo: 4},
			{nombre: "Estacion 5", codigo: 5},
			];
		$scope.cambiarEstacionSeleccionada = function(estacion){
			$scope.estacionSeleccionada = estacion;
		}
		$scope.asignarDino = function(dinosaurio, estacion){
			estacion.dinosaurio = dinosaurio;
		}
		$scope.registrarRecorrido = function(){
			$scope.recorrido.estacions_attributes = {};
			for(var i=0; i<$scope.recorrido.estaciones.length;i++){
				$scope.recorrido.estacions_attributes[i] = 
					{indice: $scope.recorrido.estaciones[i].codigo, 
						dinosaurio_id: $scope.recorrido.estaciones[i].dinosaurio.id};
			}
			Recorridos.nuevo({recorrido:$scope.recorrido});
		}
	}]);

	function caete(ev) {
	    ev.preventDefault();
	}