#
# created by Radjiv Carrere
# 6 octobre 2014
#
# License MIT
MongoClient = require("mongodb")
MongoClient.connect "mongodb://127.0.0.1:27017/rainbowZoo", (err, db) ->
  throw err  if err
  db.collection "unicorn", (err, collection) ->
    collection.find().toArray (err, items) ->
      console.log items
      return

    return

  return
