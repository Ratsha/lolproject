$('document').ready(function(){

	// Update immediatly
	secondUpdater()

	// Update every 5 seconds
	/*window.setInterval(function() {
		secondUpdater()
	}, 5000)*/

})

function secondUpdater() {
	$.ajax({
		url: "../time",
		success: function(response) {
			$('#secondUpdate').text(response)
		}
	})
}