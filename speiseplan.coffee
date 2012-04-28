# Speiseplan der THM
#
# happa happa -- Gibt den Link zum aktuellen Speiseplan zurück
module.exports = (robot) ->
	robot.respond /(happa happa)|(mensa)|(was gibts zu essen\??)|(speiseplan)/i, (msg) ->
		msg.send "http://www.studentenwerk-giessen.de/docs/HSG/Speisepl%E4ne/THM-GI.pdf"


