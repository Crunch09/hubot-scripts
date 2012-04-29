# Fetches new mails to the mailinglist of FSMNI
#


HTTPS = require "https"
URL  = require "url"
HTTP = require "http"

frequency = 60000 * 5 # 5 min

ping = (msg, auth, oldFullcount) ->
    fullcount = oldFullcount
    msg.http("https://mail.google.com/mail/feed/atom")
          .headers(Authorization: auth, Accept: 'text/html')
          .get() (err,res,body) ->
            str = body.replace /\n/g, ""
            fullcountmatch = str.match(/<fullcount>(.*)<\/fullcount/)
            fullcount = fullcountmatch[1]
            if fullcount > oldFullcount
              entries = str.match(/<entry>(.*)<\/entry>/g)
              e = entries[0].split "</entry>"
              diff = fullcount - oldFullcount
              for entry in e
                if ((--diff) < 0)
                  break
                if entry == ""
                  continue
                authormatch = entry.match(/<author>(.*)<\/author>/)
                namematch = authormatch[1].match(/<name>(.*)<\/name>/)
                emailmatch = authormatch[1].match(/<email>(.*)<\/email>/)
                titlematch = entry.match(/<title>(.*)<\/title>/)
                summarymatch = entry.match(/<summary>(.*)<\/summary>/)
                title = titlematch[1]
                summary = summarymatch[1]
                name = namematch[1]
                email = emailmatch[1]
                msg.send("Neue Mail auf der Mailingliste: #{name} <#{email}>: #{title} -> #{summary}")
              else if fullcount < oldFullcount
                # neuer Init
                oldFullcount = 0
    setTimeout (->
      ping(msg,auth,fullcount)
    ), frequency

module.exports = (robot) ->
  
        

  robot.respond /mail ([0-9]+)/i, (msg) ->
    fullcount = msg.match[1]
    console.log(fullcount)
    user = process.env.GMAIL_USER
    pass = process.env.GMAIL_PASS
    auth = "Basic " + new Buffer(user + ":" + pass).toString('base64');
    ping(msg, auth, fullcount)
    
  









