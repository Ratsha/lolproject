var mysql = require('mysql')
var fs = require('fs')

var env = fs.readFileSync('.env').toString()
env = JSON.parse(env)

var DB = mysql.createConnection({
	host: env.db.host,
	user: env.db.user,
	password: env.db.password,
	database: env.db.name
})

DB.connect(function(err){
	if(err) {
		console.log("Error connecting to database", err);    
	}
})

module.exports = DB
/*
DB.connect(function(err){
	if(err) {
		console.log("Error connecting to database", err);    
	}


	riot.callApi("https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion?champData=image", function(response) {
		response = JSON.parse(response)
		champions = Object.keys(response.data)
		for (i = 0; i < champions.length; i++) {
			champ = response.data[ champions[i] ]
			row = {
				championId: champ.id,
				name: champ.name,
				image: '..'
			}
			var query = DB.query('INSERT INTO champions SET ?', row, function(err, result) {

			})
		}
	})
})
*/