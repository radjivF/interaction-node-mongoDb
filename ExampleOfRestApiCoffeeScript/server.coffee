# raibowZooServer.coffee
#
# created by Radjiv Carrere
# 1 november 2014
#
# License MIT
#

express = require("express")
unicorn = require("./routes/unicorns")
app = express()
app.configure ->
  app.use express.logger("dev") # 'default', 'short', 'tiny', 'dev'
  app.use express.bodyParser()
  return

app.get "/unicorns", unicorn.findAll
app.get "/unicorns/:id", unicorn.findById
app.post "/unicorns", unicorn.addUnicorn
app.put "/unicorns/:id", unicorn.updateUnicorn

app.delete "/unicorns/:id", unicorn.deleteUnicorn
app.listen 3000
console.log "Listening on port 3000..."
