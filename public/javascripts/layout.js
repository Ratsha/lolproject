$('document').ready(function(){

	$('#summonerSearch').submit(function(event) {
		event.preventDefault()
		var summonerName = $('#summonerSearchName').val()
		window.location.href = "search/"+summonerName
	})
})