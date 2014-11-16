# makeIncrementalId.js
#
# How to make an incremental Id?
#
# created by Radjiv Carrere
# 6 octobre 2014
#
# License MIT
MongoClient = require("mongodb")
MongoClient.connect "mongodb://127.0.0.1:27017/rainbowZoo", (err, db) ->
  throw err  if err
  db.collection "unicorn", (err, collection) ->
    collection.count (err, counter) ->
      console.log counter
      unicorn =
        id: counter + 1
        name: "robert"
        birthday: "02/10/2010"
        status: "sleepy"

      collection.save unicorn, (err, object) ->
        if err
          console.warn err.message # returns error if no matching object found
        else
          console.dir object
        return

      return

    return

  return

