# Fetches new mails to the mailinglist of FSMNI
#


HTTPS = require "https"
URL  = require "url"
HTTP = require "http"

frequency = 60000 * 5

ping = (msg, auth) ->
		msg.http("https://mail.google.com/mail/feed/atom")
	      	.headers(Authorization: auth, Accept: 'text/html')
	      	.get() (err,res,body) ->
	      	str = body.replace /\n/g, ""
	      	entry = str.match(/<entry>(.*)<\/entry>/)
	      	authormatch = entry[1].match(/<author>(.*)<\/author>/)
	      	namematch = authormatch[1].match(/<name>(.*)<\/name>/)
	      	emailmatch = authormatch[1].match(/<email>(.*)<\/email>/)
	      	titlematch = entry[1].match(/<title>(.*)<\/title>/)
	      	summarymatch = entry[1].match(/<summary>(.*)<\/summary>/)
	      	title = titlematch[1]
	      	summary = summarymatch[1]
	      	name = namematch[1]
	      	email = emailmatch[1]
	      	console.log(name)
	      	console.log(email)
	      	console.log(title)
	      	console.log(summary)

module.exports = (robot) ->
	
      	

  robot.respond /mail/i, (msg) ->
    user = process.env.GMAIL_USER
    pass = process.env.GMAIL_PASS
    auth = "Basic " + new Buffer(user + ":" + pass).toString('base64');
    ping(msg, auth)
    
  









