var express = require('express'),
    unicorn = require('./routes/unicorns');

var app = express();

app.configure(function () {
    app.use(express.logger('dev'));     /* 'default', 'short', 'tiny', 'dev' */
    app.use(express.bodyParser());
});

app.get('/unicorns', unicorn.findAll);
app.get('/unicorns/:id', unicorn.findById);
app.post('/unicorns', unicorn.addUnicorn);
app.put('/unicorns/:id', unicorn.updateUnicorn);
app.delete('/unicorns/:id', unicorn.deleteUnicorn);

app.listen(3000);
console.log('Listening on port 3000...');
