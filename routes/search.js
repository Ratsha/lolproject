var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/:summoner', function(req, res, next) {
	var summoner = req.params.summoner

	// Sent to String
	summoner = summoner.toString()

	// Santize summoner name
	if (summoner == "")
	{
		var err = new Error('Summoner name is empty')
		err.status = 500
		next(err)
	}

    // Grap some data
    performance = {
    	"status": "Platinum",
    	"percentToMaster": 83.4,
    	"lastUpdated": 1484948485,
    	"wardsPlaced": [
    		5,
    		3,
    		7,
    		3,
    		2
    	]
    }
	
	res.render('search', {
							summoner: summoner,
							performance: performance
						})
});

module.exports = router;
