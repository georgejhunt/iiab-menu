// arrange.js
// copyright 2018 George Hunt

// debug

var action = "right";
var defUrl = "/menus-service/";
// following are the highlighted lines on left(present) 
//    and right(available) columns
var available_element = {};
var present_element = {};

if(typeof debug == 'undefined') {
	debug = true;
}

$( document ).ready(function() {
    get_languages();
    get_available();
    get_visible();
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

function available_clicked(element) {
   $( available_element ).css('background','#fff');
   available_element = element;
   $( element ).css('background','#0f0');
}

function visible_clicked(element) {
   $( present_element ).css('background','#fff');
   present_element = element;
   $( element ).css('background','#0f0');
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
         html += "<p onclick=\"available_clicked(this)\"" +
         " data-id=\"" + val['id'] + 
         "\" data-name=\"" + val['name'] + 
         "\" value=\"" + val['name'] + "\">" +
         val['title'] + " -- " + val['name'] + "--" + val['id'] + "</p>";
      });
      $("#available").html(html);    
	})
.fail(jsonErrhandler);
}

function get_visible() {
var resp = $.ajax({
		type: 'GET',
		async: true,
		url: defUrl + 'visible',
		dataType: 'json'
	})
.done(function( data ) {
      var html = '';
      $.each( data, function( key, val ) {
         html += "<p onclick=\"visible_clicked(this)\"" +
         " data-id=\"" + val['id'] + 
         "\" data-name=\"" + val['name'] + 
         "\" value=\"" + val['name'] + "\">" +
         val['title'] + " -- " + val['name'] + "--" + val['id'] + "</p>";
      });
      $("#present").html(html);    
	})
.fail(jsonErrhandler);
}
function choose(id) {
var resp = $.ajax({
		type: 'GET',
		async: true,
		url: defUrl + 'choose?id=' + id,
		dataType: 'json'
	})
.done(function( data ) {
      //alert(data);
      return data['status'];
	})
.fail(jsonErrhandler);
}

function unchoose(id) {
var resp = $.ajax({
		type: 'GET',
		async: true,
		url: defUrl + 'unchoose?id=' + id,
		dataType: 'json'
	})
.done(function( data ) {
      //alert(data);
      return data['status'];
	})
.fail(jsonErrhandler);
}

function leftclick () {
   //alert('in leftclick');
   choose($( available_element ).data('id'));
   get_visible();
   location.reload();
}

function rightclick () {
   unchoose($( present_element ).data('id'));
   get_visible();
   location.reload();
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

