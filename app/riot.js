var express = require('express')
var fs = require('fs')
var https = require('https')


function callApi(url, response) {
	// Identify whether url contains full url or partial
	if ( url.indexOf('http') > -1 ) {
		var urlModule = require('url');
		host = urlModule.parse(url).hostname
	} else {
		host = 'euw.api.pvp.net'
	}

	var env = fs.readFileSync('.env').toString()
	env = JSON.parse(env)
	// Identify whether string parameter is set
	if ( url.indexOf('?') > -1 ) {
		urlEnding = '&api_key='+env.apikey
	} else {
		urlEnding = '?api_key='+env.apikey
	}
	
	console.log("RiotAPI: "+host+url)

	return https.get({
		host: host,
		path: url+urlEnding
	}, function(res) {
		// Continuously update stream with data
		var body = '';
		res.on('data', function(d) {
			body += d;
		});
		res.on('end', function() {
			response(body);
		});
	})
}

function getSummonerId(summonerName, summonerId) {
	var file = fs.readFileSync('data/summonerNames2Id.json', 'utf8');
	summoners = JSON.parse(file)
	if (summoners.hasOwnProperty(summonerName)) {
		console.log("Returned summonerId from file")
		summonerId(summoners[summonerName])
	} else {
		callApi('/api/lol/euw/v1.4/summoner/by-name/'+summonerName, function(response) {
			response = JSON.parse(response)
			summonerId = response[summonerName]['id']
			summonerId(summonerId)
			summoners[summonerName] = summonerId
			fs.writeFile('data/summonerNames2Id.json', JSON.stringify(summoners), function(err) {
			    if(err) {
			        return console.log(err);
			    }
			    console.log("The file was saved!");
			});
			console.log("Returned summonerId from API")
		})
	}

}


module.exports.getSummonerId = getSummonerId;
module.exports.callApi = callApi;