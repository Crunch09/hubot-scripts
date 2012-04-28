# Derp me, Derp.
#
# return the famous derp song
module.exports = (robot) ->
	robot.respond /(derp me)|(derp song)|(dirk me)|(dirk is so smart)/i, (msg) ->
		msg.send "http://www.youtube.com/watch?v=nQB4nAjZIdE"