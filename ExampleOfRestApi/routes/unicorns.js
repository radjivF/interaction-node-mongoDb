var mongo = require('mongodb');

var Server = mongo.Server,
    Db = mongo.Db,
    BSON = mongo.BSONPure;

var server = new Server('localhost', 27017, {auto_reconnect: true});
db = new Db('rainbowZoo', server);

db.open(function(err, db) {
    if(!err) {
        console.log("Connected to 'unicorndb' database");
        db.collection('unicorn', {strict:true}, function(err, collection) {
            if (err) {
                console.log("The 'unicorn' collection doesn't exist. Creating it with sample data...");
                populateDB();
            }
        });
    }
});

exports.findById = function(req, res) {
    var id = req.params.id;
    console.log('Retrieving unicorn: ' + id);
    db.collection('unicorn', function(err, collection) {
        collection.findOne({'_id':new BSON.ObjectID(id)}, function(err, item) {
            res.send(item);
        });
    });
};

exports.findAll = function(req, res) {
    db.collection('unicorn', function(err, collection) {
        collection.find().toArray(function(err, items) {
            res.send(items);
        });
    });
};

exports.addUnicorn = function(req, res) {
    var unicorn = req.body;
    console.log('Adding unicorn: ' + JSON.stringify(unicorn));
    db.collection('unicorn', function(err, collection) {
        collection.insert(unicorn, {safe:true}, function(err, result) {
            if (err) {
                res.send({'error':'An error has occurred'});
            } else {
                console.log('Success: ' + JSON.stringify(result[0]));
                res.send(result[0]);
            }
        });
    });
}

exports.updateUnicorn = function(req, res) {
    var id = req.params.id;
    var unicorn = req.body;
    console.log('Updating unicorn: ' + id);
    console.log(JSON.stringify(unicorn));
    db.collection('unicorn', function(err, collection) {
        collection.update({'_id':new BSON.ObjectID(id)}, unicorn, {safe:true}, function(err, result) {
            if (err) {
                console.log('Error updating unicorn: ' + err);
                res.send({'error':'An error has occurred'});
            } else {
                console.log('' + result + ' document(s) updated');
                res.send(unicorn);
            }
        });
    });
}

exports.deleteUnicorn = function(req, res) {
    var id = req.params.id;
    console.log('Deleting unicorn: ' + id);
    db.collection('unicorn', function(err, collection) {
        collection.remove({'_id':new BSON.ObjectID(id)}, {safe:true}, function(err, result) {
            if (err) {
                res.send({'error':'An error has occurred - ' + err});
            } else {
                console.log('' + result + ' document(s) deleted');
                res.send(req.body);
            }
        });
    });
}

/*--------------------------------------------------------------------------------------------------------------------*/
// Populate database with sample data -- Only used once: the first time the application is started.
// You'd typically not find this code in a real-life app, since the database would already exist.
var populateDB = function() {

    var unicorns = [
    {
      "name":"charlie",
      "birthday": "02/10/2010",
      "status":"sleepy"
    },
    {
        "name":"sam",
        "birthday": "02/10/2012",
        "status":"exited"
    }];

    db.collection('unicorn', function(err, collection) {
        collection.insert(unicorns, {safe:true}, function(err, result) {});
    });

};
