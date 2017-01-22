var express = require('express')
var router = express.Router()

/* GET users listing. */
router.get('/', function(req, res, next) {
	var date = new Date()
	res.send( date.getSeconds().toString() )
});

module.exports = router
