# Derp me, Derp.
#
# returns the famous derp song
module.exports = (robot) ->
	robot.respond /(derp me)|(derp song)/i, (msg) ->
		msg.send "http://www.youtube.com/watch?v=nQB4nAjZIdE"