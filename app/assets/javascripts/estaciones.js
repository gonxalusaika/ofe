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
	.controller('estacionesController', function($scope, $resource){
		var algo = $resource('api/dinosaurios.json', {}, {
			query: {method:'GET', params:{}, isArray:true}
		});
		$scope.dinosaurios = algo.query();

		$scope.estaciones = [
			{nombre: "Estacion 1"},
			{nombre: "Estacion 2"},
			{nombre: "Estacion 3"},
			{nombre: "Estacion 4"},
			{nombre: "Estacion 5"},
			];
		$scope.cambiarEstacionSeleccionada = function(estacion){
			$scope.estacionSeleccionada = estacion;
		}
		$scope.asignarDino = function(dinosaurio, estacion){
			estacion.dinosaurio = dinosaurio;
		}
	});

	function caete(ev) {
	    ev.preventDefault();
	}