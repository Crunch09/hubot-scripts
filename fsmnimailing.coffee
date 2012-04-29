# target url https://thmhubot:fsmni2012@mail.google.com/mail/feed/atom
# url = "https://thmhubot:fsmni2012@mail.google.com/mail/feed/atom"


HTTP = require "http"
URL  = require "url"

feed = "https://thmhubot:fsmni2012@mail.google.com/mail/feed/atom"

module.exports = (robot) ->
	robot.respond /test (.*)$/i, (msg) ->
		msg.send(msg.match[1])
		msg.send(feed)
		ping(feed)
