require('dotenv').config({path:'variaveis.env'});
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const routes = require('./routes');

const app = express();
const port = 3000;


app.use(cors());
app.use(express.json());
const index = express();
index.use(cors());
index.use(bodyParser.urlencoded ({extended: false}));

// Usa as rotas definidas no arquivo routes.js
app.use('/', routes);

app.listen(port, () => {
    console.log('Aplicacao rodando na porta 3000');
});

