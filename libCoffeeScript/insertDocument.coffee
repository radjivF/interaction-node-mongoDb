# insertDocument.js
#
# How to insert a new document
#
# created by Radjiv Carrere
# 6 octobre 2014
#
# License MIT
MongoClient = require("mongodb")
MongoClient.connect "mongodb://127.0.0.1:27017/rainbowZoo", (err, db) ->
  throw err  if err
  unicorn =
    name: "robert"
    birthday: "02/10/2010"
    status: "sleepy"

  db.collection("unicorn").insert unicorn, (err, object) ->
    if err
      console.warn err.message # returns error if no matching object found
    else
      console.dir object
    return

  return

