/*
Argument 0: node
Argument 1: storeMatches.js
Argument 2: SummonerId
Argument 3: Amount of matches
*/
var mysql = require('mysql');
var fs = require('fs')
var riot = require('../app/riot.js')

var env = fs.readFileSync('.env').toString()
env = JSON.parse(env)

var DB = mysql.createConnection({
	host: env.db.host,
	user: env.db.user,
	password: env.db.password,
	database: env.db.name
})

var summonerId = process.argv[2];
var amountOfMatches = process.argv[3];

DB.connect(function(err){
	if(err) {
		console.log("Error connecting to database", err);    
	}

	riot.callApi('/api/lol/euw/v2.2/matchlist/by-summoner/'+summonerId, function(response) {
		var response = JSON.parse(response)

		function fetchMatches(amount, matchList, index) {

			matchId = matchList.matches[index].matchId
			timestamp = matchList.matches[index].timestamp
			championId = matchList.matches[index].champion

			DB.query("SELECT matchId FROM matches WHERE matchId = ?", matchList.matches[index].matchId, function(err, rows, fields) {
				index++
				if (rows.length > 0) {
					fetchMatches(amount, matchList, index)
					return
				}

				riot.callApi('/api/lol/euw/v2.2/match/'+matchId, function(matchResponse) {
					amount--
					matchResponse = JSON.parse(matchResponse)
					matchResponse = JSON.stringify(matchResponse)

					match = {
						matchId: matchId,
						summonerId: summonerId,
						time: timestamp,
						championId: championId,
						content: matchResponse
					}

					DB.query('INSERT IGNORE INTO matches SET ?', match, function(err, result) {
						if (err) {
							console.log("Cannot save match to database: ", err)
						}

						console.log("Match "+matchId+" insert into DB")
						if (amount > 0) {
							fetchMatches(amount, matchList, index)
						} else {
							console.log("Storing Matches complete")
							process.exit()
						}
					})
				})
			})
		}

		fetchMatches(amountOfMatches, response, 0)

	})
})