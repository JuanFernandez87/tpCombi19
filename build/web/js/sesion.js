$(document).ready(function(){/*solo se ejecuta el JS una vez que se haya cargado el html y css completo*/
	$(' .menu li:has(ul)').click(function(e){/* con este codigo accedemos solo al submenu creado*/
		/*e.preventDefault();/*al presionar el boton no redirige a otra url*/

		if($(this).hasClass('activado')){/*pregunta si el elemento clickeado tiene la clase "activado"*/
		   $(this).removeClass('activado');
		   $(this).children('ul').slideUp();
		} else {
			$('.menu li ul').slideUp();
			$('.menu li').removeClass('activado');
			$(this).addClass('activado');
			$(this).children('ul').slideDown(); 
		}
	});

	$('.btn-menu').click(function(){
		$('.contenedor-menu .menu').slideToggle();
	});

	$(window).resize(function(){
		if($(document).width()> 450){
			$('.contenedor-menu .menu').css({'display' :' block'});
	}
		if($(document).width()< 450){
			$('.contenedor-menu .menu').css({'display' :' none'});
			$('.menu li').removeClass('activado');
		}		
});
});
