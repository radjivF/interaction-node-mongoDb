mongo = require("mongodb")
Server = mongo.Server
Db = mongo.Db
BSON = mongo.BSONPure
server = new Server("localhost", 27017,
  auto_reconnect: true
)
db = new Db("rainbowZoo", server)
db.open (err, db) ->
  unless err
    console.log "Connected to 'unicorndb' database"
    db.collection "unicorn",
      strict: true
    , (err, collection) ->
      if err
        console.log "The 'unicorn' collection doesn't exist. Creating it with sample data..."
        populateDB()
      return

  return

exports.findById = (req, res) ->
  id = req.params.id
  console.log "Retrieving unicorn: " + id
  db.collection "unicorn", (err, collection) ->
    collection.findOne
      _id: new BSON.ObjectID(id)
    , (err, item) ->
      res.send item
      return

    return

  return

exports.findAll = (req, res) ->
  db.collection "unicorn", (err, collection) ->
    collection.find().toArray (err, items) ->
      res.send items
      return

    return

  return

exports.addUnicorn = (req, res) ->
  unicorn = req.body
  console.log "Adding unicorn: " + JSON.stringify(unicorn)
  db.collection "unicorn", (err, collection) ->
    collection.insert unicorn,
      safe: true
    , (err, result) ->
      if err
        res.send error: "An error has occurred"
      else
        console.log "Success: " + JSON.stringify(result[0])
        res.send result[0]
      return

    return

  return

exports.updateUnicorn = (req, res) ->
  id = req.params.id
  unicorn = req.body
  console.log "Updating unicorn: " + id
  console.log JSON.stringify(unicorn)
  db.collection "unicorn", (err, collection) ->
    collection.update
      _id: new BSON.ObjectID(id)
    , unicorn,
      safe: true
    , (err, result) ->
      if err
        console.log "Error updating unicorn: " + err
        res.send error: "An error has occurred"
      else
        console.log "" + result + " document(s) updated"
        res.send unicorn
      return

    return

  return

exports.deleteUnicorn = (req, res) ->
  id = req.params.id
  console.log "Deleting unicorn: " + id
  db.collection "unicorn", (err, collection) ->
    collection.remove
      _id: new BSON.ObjectID(id)
    ,
      safe: true
    , (err, result) ->
      if err
        res.send error: "An error has occurred - " + err
      else
        console.log "" + result + " document(s) deleted"
        res.send req.body
      return

    return

  return


#--------------------------------------------------------------------------------------------------------------------

# Populate database with sample data -- Only used once: the first time the application is started.
# You'd typically not find this code in a real-life app, since the database would already exist.
populateDB = ->
  unicorns = [
    {
      name: "charlie"
      birthday: "02/10/2010"
      status: "sleepy"
    }
    {
      name: "sam"
      birthday: "02/10/2012"
      status: "exited"
    }
  ]
  db.collection "unicorn", (err, collection) ->
    collection.insert unicorns,
      safe: true
    , (err, result) ->

    return

  return
