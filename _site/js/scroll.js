$(document).ready(function() {
   // put all your jQuery goodness in here.
	
	$('.scrollPage').click(function() {
	   var elementClicked = $(this).attr("href");
	   var destination = $(elementClicked).offset().top;
	   $("html:not(:animated),body:not(:animated)").animate({ scrollTop: destination-20}, 500 );
	   return false;
	});
 });

