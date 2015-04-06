$(document).ready(function() {

	function getLocation() {
		navigator.geolocation.getCurrentPosition(showPosition);
	}

	function showPosition(position) {
		var cookie_var = position.coords.latitude + "," + position.coords.longitude;
		document.cookie = "lat_long=" + encodeURI(cookie_var);
	}

	$("div#foursquare").hide();

	$("button#flink").click(function(e) {
		getLocation();
	});
	
});

