var express = require('express')
var fs = require('fs')
var riot = require('../app/riot.js')
var https = require('https')
var router = express.Router()


/* Search for a summoner */
router.get('/:summoner', function(req, res, next) {
	var summonerName = req.params.summoner

	var adam = "INITIAL"
	// Santize summoner name
	if (summonerName == "")
	{
		var err = new Error('Summoner name is empty')
		err.status = 500
		next(err)
	}

	summonerId = riot.getSummonerId(summonerName)
	performance = {
		"status": "Platinum",
		"percentToMaster": 83.4,
		"lastUpdated": 1484948485,
		"wardsPlaced": [
			5,
			3,
			1,
			7,
			3,
			2
		]
	}
	
	res.render('search', {
							summoner: summonerId,
							performance: performance
						})
})

module.exports = router
