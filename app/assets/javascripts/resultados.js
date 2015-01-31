// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var app = angular.module('Resultados', ["highcharts-ng", 'n3-pie-chart', 'ngResource'])
  .factory('ResultadosSvc', ['$resource', function($resource){
    return $resource('/api/resultados/recorrido/:recorrido_id', {}, {
      recorrido: {method:'GET', params:{}}
    });
  }])
	.controller('ResultadosController', ['$scope', 'ResultadosSvc', function($scope, ResultadosSvc){

    $scope.pie_options = {thickness: 50};

    $scope.preparar_datos = function(){
      ResultadosSvc.recorrido({recorrido_id: id},
        function(res){
          $scope.recorrido = res;
          $scope.cargar_porcentajes();
        },
        function(err){
          toastr.error("Hubo un error cargando la información.")
        });
    };
    $scope.cargar_porcentajes = function(){
      $scope.recorrido.info_grafico = generar_chart('column', 'Respuestas correctas por estacion', {categories: ['Estacion 1']}, 
{
            min: 0,
            title: {
                text: 'Total fruit consumption'
            }
        }

);
      angular.forEach($scope.recorrido.estacions, function(estacion, iEstacion){
        estacion.indice = iEstacion +1;
        estacion.cantidad_correctas = 0;
        estacion.cantidad_incorrectas = 0;
        angular.forEach(estacion.preguntas, function(pregunta, iPregunta){
          pregunta.cantidad_correctas   = 0;
          pregunta.cantidad_incorrectas = 0;
          pregunta.info_grafico = generar_chart('pie', pregunta.contenido);

          angular.forEach(pregunta.respuestas, function(respuesta, iRespuesta){
            var data = {name: wordwrap(respuesta.contenido, 30, '<br>'), y: respuesta.cantidad_elegida};
            if(respuesta.es_correcta)
              data.sliced = true;
            pregunta.info_grafico.series[0].data.push(data);
            if(respuesta.es_correcta){
              pregunta.cantidad_correctas += respuesta.cantidad_elegida;
              pregunta.respuesta_correcta = respuesta;
            }
            else
              pregunta.cantidad_incorrectas  += respuesta.cantidad_elegida;
          });
          // if(pregunta.cantidad_correctas + pregunta.cantidad_incorrectas == 0)
          //   pregunta.cantidad_incorrectas = 1;
          pregunta.porcentaje_correctas = (pregunta.cantidad_correctas * 100 / (pregunta.cantidad_correctas + pregunta.cantidad_incorrectas) ).toFixed(2) || 0;
            // pregunta.info_grafico.series[0].data.push({name: "Correctas", y: pregunta.cantidad_correctas});
            // pregunta.info_grafico.series[0].data.push({name: "Inorrectas", y: pregunta.cantidad_incorrectas});
          // pregunta.info_grafico = [{value: pregunta.cantidad_correctas, color: "#3a3"}, {value: pregunta.cantidad_incorrectas, color: "#971"}];
          estacion.cantidad_correctas += pregunta.cantidad_correctas;
          estacion.cantidad_incorrectas += pregunta.cantidad_incorrectas;
        });
        $scope.recorrido.info_grafico.series[0].data.push({name: "Estacion " + estacion.indice , y: estacion.cantidad_correctas});
        estacion.porcentaje_correctas = (estacion.cantidad_correctas * 100 / (estacion.cantidad_correctas + estacion.cantidad_incorrectas) ).toFixed(2);
        estacion.info_grafico = [{value: estacion.cantidad_correctas, color: "#3a3"}, {value: estacion.cantidad_incorrectas, color: "#111"}];
      });
    }
    $scope.seleccionar_estacion = function(estacion){
      $scope.estacion_seleccionada = estacion;
      // $('#modalEstacion').modal();
    }

    var generar_chart = function(tipo, titulo, xAxis, yAxis){
      return {
        options:{
          chart:{
            type: tipo
          },
          legend: {
            enabled: false
          }
        },
        title: {
          text: titulo
        }, 
        legend: {
          enabled: true
        }, 
        xAxis: xAxis,
        yAxis: yAxis, 
        series: [{
          name: 'respuestas correctas', 
          step: 'center', 
          data:[]
        }]};
    }

    $scope.chartConfig = {

  //This is not a highcharts object. It just looks a little like one!
  options: {
      //This is the Main Highcharts chart config. Any Highchart options are valid here.
      //will be ovverriden by values specified below.
      chart: {
          type: 'pie'
      },
      tooltip: {
          style: {
              padding: 10,
              fontWeight: 'bold'
          }
      }
  },
  //The below properties are watched separately for changes.


  //Series object (optional) - a list of series using normal highcharts series options.
  series: [{
     data: [10, 15, 12, 8, 7]
  }],
  //Boolean to control showng loading status on chart (optional)
  //Could be a string if you want to show specific loading text.
  loading: false,
  //Configuration for the xAxis (optional). Currently only one x axis can be dynamically controlled.
  //properties currentMin and currentMax provied 2-way binding to the chart's maximimum and minimum
  xAxis: {
  currentMin: 0,
  currentMax: 20,
  title: {text: 'values'}
  },
  //Whether to use HighStocks instead of HighCharts (optional). Defaults to false.
  useHighStocks: false,
  //size (optional) if left out the chart will default to size of the div or something sensible.
  
  //function (optional)
  func: function (chart) {
   //setup some logic for the chart
  }
};
		// $scope.preparar_datos = function(){
		// 	$scope.preguntas = preguntas;
		// 	preguntas = undefined;

		// 	angular.forEach($scope.preguntas, function(pregunta, key){
		// 		var datoCorrectas 	= {label: "correctas", 		value: 0, color: "#3a3"};
		// 		var datoIncorrectas = {label: "incorrectas", 	value: 0, color: "#971"};
		// 		angular.forEach(pregunta.respuestas, function(respuesta, key2){
		// 			if(respuesta.es_correcta){
		// 				datoCorrectas['value'] += respuesta.cantidad_elegida;
		// 			}
		// 			else{
		// 				datoIncorrectas['value'] += respuesta.cantidad_elegida;
		// 			}
		// 		});
  //               pregunta.porcentaje_correctas = (datoCorrectas.value * 100 /(datoCorrectas.value + datoIncorrectas.value)).toFixed(2) || 0;
		// 		pregunta.datos = [datoCorrectas, datoIncorrectas];
		// 	});
		// }

		// $scope.options = {thickness: 50};
		// $scope.preparar_datos();

  //   $scope.slices = {
  //     "percentages": [25,20,20,5,30],
  //     "colors": ['gray', 'green', 'blue', 'pink', 'orange'],
  //     "elements": ['banana', 'clock', 'beetroot', 'planet', 'ball']
  //   }

    // var piechart  = Object.create(PieChart);
    // piechart.segmentMode = true;
    // piechart.drawPieChart($scope.slices, 'can');
    $scope.preparar_datos();
	}]);
  // .directive('chart', function(){
  //   return {
  //     link: function(scope, element, attrs){
  //       var slices = attrs.pieChart;
  //       var piechart  = Object.create(PieChart);
  //       piechart.segmentMode = true;
  //       piechart.drawPieChart(slices, atrs.id);
  //     }}
  // });

  // var PieChart = { 
  //   drawPieChart: function (slices, id) {

  //       var percentElements = slices.percentages;
  //       var colorElements = slices.colors;

  //       var canvas = document.getElementById(id);
  //       var context = canvas.getContext("2d");

  //       var centerX = canvas.width / 2;
  //       var centerY = canvas.height / 2;
  //       var radius = 80;

  //       context.beginPath();
  //       var endAngle = 2 * Math.PI

  //       var lastAngle = 0;

  //       for (var i = 0; i < percentElements.length; i++) {
  //           var percent = percentElements[i];
  //           var color = colorElements[i];

  //           var currentSegment = endAngle * (percent / 100);
  //           var currentAngle = currentSegment + lastAngle;

  //           context.beginPath();
  //           context.moveTo(centerX, centerY)
  //           context.arc(centerX, centerY, radius, lastAngle, currentAngle, false);
  //           context.closePath();

  //           lastAngle = lastAngle + currentSegment;

  //           context.fillStyle = color;
  //           context.fill();

  //           if (this.segmentMode) {
  //               context.lineWidth = 10;
  //               context.strokeStyle = 'white';

  //           }else {
  //               context.lineWidth = 1;
  //               context.strokeStyle = 'white';

  //           }
  //           context.stroke();
  //           context.fill();
  //       }
  //       if (this.segmentMode) {

  //           context.beginPath();
  //           context.fillStyle = 'white';
  //           context.arc(centerX, centerY, radius - 40, 0, 2 * Math.PI, false);
  //           context.fill();
  //       }
  //   }
  // }

function wordwrap( str, width, brk, cut ) {
 
    brk = brk || '\n';
    width = width || 75;
    cut = cut || false;
 
    if (!str) { return str; }
 
    var regex = '.{1,' +width+ '}(\\s|$)' + (cut ? '|.{' +width+ '}|.+$' : '|\\S+?(\\s|$)');
 
    return str.match( RegExp(regex, 'g') ).join( brk );
 
}