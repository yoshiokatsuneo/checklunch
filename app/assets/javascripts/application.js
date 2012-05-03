// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

if(navigator.cookieEnabled){
	var now = new Date();
	var gmtoffset = now.getTimezoneOffset();
	if($.cookie('gmtoffset') != gmtoffset){
	$.event.add(window, 'load', function(e) {
	// use ajax to set the time zone here.
	var set_time = $.ajax({url:'/gmtoffset/gmtoffset?gmtoffset='+gmtoffset, success:function(resonse){alert("aa"); document.location.reload();} });
	});
	}
}
