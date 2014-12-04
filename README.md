Interaction MongoDB (2.2) with Node.js
======================================

In lib folder you have different files with interaction example how to use MongoDb with Nodejs.

Every files can work independant.

In Rest Api folder you have an example in a real case.

Don't forget to install the package for the REST Api:
```
npm install
```

In the lib folder you have separate example to show: how to use the each functions of mongoDb.
In the lib coffee script folder you have separate example to show: how to use the each functions of mongoDb but with coffeescript syntax.

You have a Rest Api example in the folder RestAPiExample, this is a global example how to use MongoDb in a real case.
And of course the same Api with coffee Script syntax.


What is MongoDB?
================

Written in: C++

Main point: Retains some friendly properties of SQL. (Query, index)

License: AGPL (Drivers: Apache)

Protocol: Custom, binary (BSON)

Master/slave replication (auto failover with replica sets)
Sharding built-in
Queries are javascript expressions

Run arbitrary javascript functions server-side
Better update-in-place than CouchDB
Uses memory mapped files for data storage
Performance over features
Journaling (with --journal) is best turned on
On 32bit systems, limited to ~2.5Gb
An empty database takes up 192Mb
GridFS to store big data + metadata (not actually an FS)
Has geospatial indexing
Data center aware

Best used: If you need dynamic queries. If you prefer to define indexes, not map/reduce functions. If you need good performance on a big DB. If you wanted CouchDB, but your data changes too much, filling up disks.

For example: For most things that you would do with MySQL or PostgreSQL, but having predefined columns really holds you back.

Testing the API using cURL
==========================

If you want to test your API before using it in a client application, you can invoke your REST services straight from a browser address bar. For example, you could try:
```
http://localhost:3000/unicorns
```
You will only be able to test your GET services that way. A more versatile solution to test RESTful services is to use cURL, a command line utility for transferring data with URL syntax.

For example, using cURL, you can test the Wine Cellar API with the following commands:

Get all unicorns:
```
curl -i -X GET http://localhost:3000/unicorns
```
Get unicorn with _id value of 5069b47aa892630aae000007 (use a value that exists in your database):

```
curl -i -X GET http://localhost:3000/unicorns/5069b47aa892630aae000007
```
Delete unicorn with _id value of 5069b47aa892630aae000007:
```
curl -i -X DELETE http://localhost:3000/unicorns/5069b47aa892630aae000007
```
Add a new unicorn:
```
curl -i -X POST -H 'Content-Type: application/json' -d '{"name": "charlie", "status": "happy"}' http://localhost:3000/unicorns
```
Modify unicorn with _id value of 5069b47aa892630aae000007:
```
curl -i -X PUT -H 'Content-Type: application/json' -d '{"name": "charlie", "status": "happy"}' http://localhost:3000/unicorns/5069b47aa892630aae000007
```

Licence
=======
MIT License. See LICENSE for details.

Copyright 
=========
It's just example for tutorial so no copyright, use it like you want.
