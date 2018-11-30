// arrange.js
// copyright 2018 George Hunt

// debug

var action = "right";
var defUrl = "/menus-service/";

if(typeof debug == 'undefined') {
	debug = true;
}

$( document ).ready(function() {
    rightclick();
    get_languages();
    get_available();
});

function upclick () {
   action = "up";
   $("#up").css("background-color","rgb(0,200,0)");
   $("#down").css("background-color","transparent");
   $("#right").css("background-color","transparent");
}
function downclick () {
   action = "down";
   $("#down").css("background-color","rgb(0,200,0)");
   $("#up").css("background-color","transparent");
   $("#right").css("background-color","transparent");
}

function rightclick () {
   action = "right";
   $("#right").css("background-color","rgb(0,200,0)");
   $("#up").css("background-color","transparent");
   $("#down").css("background-color","transparent");
}

function get_languages() {
var resp = $.ajax({
		type: 'GET',
		async: true,
		url: defUrl + 'langsavail',
		dataType: 'json'
	})
.done(function( data ) {
      alert(data);
      $.each( data, function( key, val ) {
         $("#lang").append("<option data-id=\"" +
         val['id'] + "\" value=\"" +
         val['lang'] + "\" text=\"" +
         val['name'] + "\" </option>");
      })
	});
//.fail(jsonErrhandler);
}

function get_available() {
var resp = $.ajax({
		type: 'GET',
		async: true,
		url: defUrl + 'available',
		dataType: 'json'
	})
.done(function( data ) {
      var html = '';
      $.each( data, function( key, val ) {
         html += "<p onclick=\"available_clicked(this.id) data-id=\"" +
         val['id'] + "\" value=\"" +
         val['name'] + "\">" +
         val['title'] + " -- " + val['name'] + "</p>";
         //alert(html);
      });
      var place = $("#available").contents().find('body');
      place.html(html);
	})
.fail(jsonErrhandler);
}

function consoleLog (msg)
{
	if (debug == true)
	console.log(msg); // for IE there can be no console messages unless in tools mode
}

function jsonErrhandler (jqXHR, textStatus, errorThrown)
{
	// only handle json parse errors here, others in ajaxErrHandler
	//  if (textStatus == "parserror") {
	//    //alert ("Json Errhandler: " + textStatus + ", " + errorThrown);
	//    displayServerCommandStatus("Json Errhandler: " + textStatus + ", " + errorThrown);
	//  }
	consoleLog("In Error Handler logging jqXHR");
	consoleLog(textStatus);
	consoleLog(errorThrown);
	consoleLog(jqXHR);

	return false;
}

