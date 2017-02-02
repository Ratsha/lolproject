var express = require('express')
var fs = require('fs')
var https = require('https')


function callApi(url, response) {

	var env = fs.readFileSync('.env').toString()
	env = JSON.parse(env)

	console.log("RiotAPI: "+url)

	return https.get({
		host: 'euw.api.pvp.net',
		path: url+'?api_key='+env.apikey
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