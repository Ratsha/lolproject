var express = require('express')
var fs = require('fs')
var https = require('https')
var riot = require('../app/riot.js')


function getMatchList(summonerID) {
	riot.callApi('/api/lol/euw/v2.2/matchlist/by-summoner/'+summonerID, function(response) {
		response = JSON.parse(response)
		var i = 0
		var individualMatch = {}
		var matchArray = []

		for(var id in response.matches){
			individualMatch = response.matches[id]
			console.log(id, individualMatch.matchId)
			matchArray[i] = individualMatch.matchId
			i++
			if (i==10){
				break
			}
		}

		console.log("---------------")

		return matchArray[0]
	})
}




module.exports.getMatchList = getMatchList;