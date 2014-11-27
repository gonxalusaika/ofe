
var initPaginaInicial = function(){
	var offset = 0;
	$(window).scroll(function(){
		var scrollPos = $(document).scrollTop() + $(window).height();
		$('.info-inicio').each(function(){
			var posicion = $(this).offset().top;
			if(scrollPos > posicion + offset){
				$(this).css('opacity', '1');
				$(this).css('transform', 'scale(1)');
			}
		});
	});
}