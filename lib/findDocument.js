// findDocument.js
//
// How to find a document in a collection
//
// created by Radjiv Carrere
// 6 octobre 2014
//
// License MIT


var MongoClient = require('mongodb');

MongoClient.connect('mongodb://127.0.0.1:27017/rainbowZoo', function(err, db) {
if(err) throw err;


db.collection('unicorn').find({name: 'eddy'}).nextObject(
  function(err, object) {
      if (err){
          console.warn(err.message);
      }else{
          console.dir(object);
      }
  });
});
