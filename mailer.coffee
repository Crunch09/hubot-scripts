# Fetches new mails to the mailinglist of FSMNI
#


HTTPS = require "https"
URL  = require "url"
HTTP = require "http"


module.exports = (robot) ->
  robot.respond /mail/i, (msg) ->
    user = process.env.GMAIL_USER
    pass = process.env.GMAIL_PASS
    auth = "Basic " + new Buffer(user + ":" + pass).toString('base64');
    msg.http("https://mail.google.com/mail/feed/atom")
      .headers(Authorization: auth, Accept: 'text/html')
      .get() (err,res,body) ->
        console.log(body)


  









