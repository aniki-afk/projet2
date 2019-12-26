/*VARIABLES*/


/*FONCTIONS*/
jQuery(function()
{
	$(function ()
	{
		$(window).scroll(function ()
		{
			if ($(this).scrollTop() > 1000 )
			{
				$('#up').css('right','10px');
			} else
			{
				$('#up').removeAttr( 'style' );
			}
		});
	});
});



$('.hchar').on('mouseover', function(){
	$('.hchars').removeClass('hide');
});

$('.hchars').on('mouseout', function(){
	$('.hchars').addClass('hide');
});

$('.user').on('mouseover', function(){
	$('.users').removeClass('hide');
});

$('.users').on('mouseout', function(){
	$('.users').addClass('hide');
});

let title = $('.title-main');
if (window.location.href.indexOf('/') != -1) {
	title.text("Kimetsu no Yaiba");
}
if (window.location.href.indexOf('/tanjiro') != -1) {
	title.text("Tanjiro Kamado");
}
if (window.location.href.indexOf('/zenitsu') != -1) {
	title.text("Zen'istu Agatsuma");
}
if (window.location.href.indexOf('/inosuke') != -1) {
	title.text("Inosuke Hashibira");
}
if (window.location.href.indexOf('/nezuko') != -1) {
	title.text("Nezuko Kamado");
}
