function getgeocoder()
{
	//if(typeof geocoder == 'undefined'){
		geocoder = new google.maps.Geocoder();
	//}
	return geocoder;
}
function showmap(key, placename) {
	// alert('showmap start');
	var geocoder = new google.maps.Geocoder();
	// var geocoder = getgeocoder();
	// var geocoder = new google.maps.Geocoder();
	geocoder.geocode( { 'address': placename}, function(results, status) {
		alert("Showing map1...(" + key + "," + placename + ") status=" + status);
		if (status == google.maps.GeocoderStatus.OK) {
			alert("Showing map...(" + key + "," + placename + ")");
			var myOptions = {
				center: results[0].geometry.location,
				zoom: 13,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				disableDefaultUI: true,
			};
			var map = new google.maps.Map(document.getElementById("map_canvas_" + key), myOptions);
			var marker = new google.maps.Marker({
				position: myOptions.center,
				map: map,
				title: placename
			});
		} else {
			// alert("Geocode was not successful for the following reason: " + status);
		}
	});
}
function showdistance(key, placename)
{
	// alert('showdistance start');
	// var geocoder = new google.maps.Geocoder();
	var geocoder = getgeocoder();
	geocoder.geocode({'address': placename}, function(results, status){
		alert("distance:Showing map1...(" + key + "," + placename + ") status=" + status);
		if(status == google.maps.GeocoderStatus.OK){
			var distance = google.maps.geometry.spherical.computeDistanceBetween(results[0].geometry.location, current_location);
			$('#map_distance_' + key).text("Distance: " + Math.round(distance) + "m");
		}
	});
}

if(! $.isEmptyObject(mapids_hash)){
	navigator.geolocation.getCurrentPosition(function(position) {
		current_location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
		for(key in mapids_hash){
			showmap(key, mapids_hash[key]);
		}
		for(key in mapids_hash){
			showdistance(key, mapids_hash[key]);
		}
	}, 
	function(error){
		alert(error);
		for(key in mapids_hash){
			showmap(key, mapids_hash[key]);
		}
	});
}
