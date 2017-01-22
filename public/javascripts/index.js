$('document').ready(function(){

	console.log("Hello Client Javascript")

	$('#summonerSearch').submit(function(event) {
		event.preventDefault()
		var summonerName = $('#summonerName').val()
		window.location.href = "search/"+summonerName
	})
})