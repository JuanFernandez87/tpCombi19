		   $('#subContViaje').hide(); // estas 3 lineas ocultan las tablas viaje,ruta e insumo. Para que solo se muestre la tabla de botones Ruta.
		   $('#subContCombi').hide();
		   $('#subContInsumo').hide();
	function showHide(){ //esta funcion se utiliza para ocultar/mostrar las tablas cuando el boton "administrar informacion" se presiona.
		if($(".menu #administrarInfo ").hasClass('activado') ){
		$(".menu #administrarInfo ").removeClass('activado');
		   $(".menu #administrarInfo ").children('ul').slideUp();
		   $('#subContCombi').hide("100");
		   $('#subContViaje').hide("100");
		   $('#subContRuta').hide("100");
		   $('#subContInsumo').hide("100");
		 }
		 else{
		 	$(".menu #administrarInfo ").addClass('activado');
			$(".menu #administrarInfo ").children('ul').slideDown(); 
			$('#subContCombi').hide("100");
		   $('#subContViaje').hide("100");
		   $('#subContRuta').hide("100");
		   $('#subContInsumo').hide("100");
		 }	
}
	function showMenuCombi(){ //mostrar/ ocultar tabla de botones cuando se presiona boton "combi" del submenu. lo mismo para los demas botones de abajo.
		if($('#subContCombi').hasClass('showed')){
			$('#subContCombi').removeClass('showed');
			$('#subContCombi').hide("100");
		}
		else{
			$('#subContCombi').addClass('showed');
			$('#subContCombi').show("100");	
		}
	}
	function showMenuViaje(){
			if($('#subContViaje').hasClass('showed')){
			$('#subContViaje').removeClass('showed');
			$('#subContViaje').hide("100");
		}
		else{
			$('#subContViaje').addClass('showed');
			$('#subContViaje').show("100");	
		}	
	}
	function showMenuRuta(){
			if($('#subContRuta').hasClass('showed')){
			$('#subContRuta').removeClass('showed');
			$('#subContRuta').hide("100");
		}
		else{
			$('#subContRuta').addClass('showed');
			$('#subContRuta').show("100");	
		}	
	}
	function showMenuInsumo(){
			if($('#subContInsumo').hasClass('showed')){
			$('#subContInsumo').removeClass('showed');
			$('#subContInsumo').hide("100");
		}
		else{
			$('#subContInsumo').addClass('showed');
			$('#subContInsumo').show("100");	
		}
	}
	//$('.menu li ul .abm').on("click",function(){
	//	alert('Has hecho click en el párrafo');
	//	$('#subCont').show();

	//});

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
