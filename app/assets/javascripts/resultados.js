// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var app = angular.module('Resultados', ['n3-pie-chart'])
	.controller('ResultadosController', ['$scope', function($scope){

		$scope.preparar_datos = function(){
			$scope.preguntas = preguntas;
			preguntas = undefined;

			angular.forEach($scope.preguntas, function(pregunta, key){
				var datoCorrectas 	= {label: "correctas", 		value: 0, color: "#3a3"};
				var datoIncorrectas = {label: "incorrectas", 	value: 0, color: "#971"};
				angular.forEach(pregunta.respuestas, function(respuesta, key2){
					if(respuesta.es_correcta){
						datoCorrectas['value'] += respuesta.cantidad_elegida;
					}
					else{
						datoIncorrectas['value'] += respuesta.cantidad_elegida;
					}
				});
				pregunta.datos = [datoCorrectas, datoIncorrectas];
			});
		}

		$scope.options = {thickness: 50};
		$scope.preparar_datos();

    $scope.slices = {
      "percentages": [25,20,20,5,30],
      "colors": ['gray', 'green', 'blue', 'pink', 'orange'],
      "elements": ['banana', 'clock', 'beetroot', 'planet', 'ball']
    }

    var piechart  = Object.create(PieChart);
    piechart.segmentMode = true;
    piechart.drawPieChart($scope.slices, 'can');

	}])
  .directive('chart', function(){
    return {
      link: function(scope, element, attrs){
        var slices = attrs.pieChart;
        var piechart  = Object.create(PieChart);
        piechart.segmentMode = true;
        piechart.drawPieChart(slices, atrs.id);
      }}
  });

  var PieChart = { 
    drawPieChart: function (slices, id) {

        var percentElements = slices.percentages;
        var colorElements = slices.colors;

        var canvas = document.getElementById(id);
        var context = canvas.getContext("2d");

        var centerX = canvas.width / 2;
        var centerY = canvas.height / 2;
        var radius = 80;

        context.beginPath();
        var endAngle = 2 * Math.PI

        var lastAngle = 0;

        for (var i = 0; i < percentElements.length; i++) {
            var percent = percentElements[i];
            var color = colorElements[i];

            var currentSegment = endAngle * (percent / 100);
            var currentAngle = currentSegment + lastAngle;

            context.beginPath();
            context.moveTo(centerX, centerY)
            context.arc(centerX, centerY, radius, lastAngle, currentAngle, false);
            context.closePath();

            lastAngle = lastAngle + currentSegment;

            context.fillStyle = color;
            context.fill();

            if (this.segmentMode) {
                context.lineWidth = 10;
                context.strokeStyle = 'white';

            }else {
                context.lineWidth = 1;
                context.strokeStyle = 'white';

            }
            context.stroke();
            context.fill();
        }
        if (this.segmentMode) {

            context.beginPath();
            context.fillStyle = 'white';
            context.arc(centerX, centerY, radius - 40, 0, 2 * Math.PI, false);
            context.fill();
        }
    }
  }
