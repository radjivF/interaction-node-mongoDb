// findWithMultipleCondition.js
//
// How to insert a new document
//
// created by Radjiv Carrere
// 6 octobre 2014
//
// License MIT


var MongoClient = require('mongodb');

MongoClient.connect('mongodb://127.0.0.1:27017/rainbowZoo', function(err, db) {
if(err) throw err;

db.collection('unicorn').find({$and :[{name: 'eddy'},{status: 'hungry'} ]}).nextObject(
  function(err, object) {
      if (err){
          console.warn(err.message);
      }else{
          console.dir(object);
      }
  });

  db.collection('unicorn').find({$or :[{status: 'sleepy'},{status: 'happy'}]}).nextObject(
    function(err, object) {
        if (err){
            console.warn(err.message);
        }else{
            console.dir(object);
        }
    });

});
