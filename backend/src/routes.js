const express = require('express');
const router = express.Router(); // Use express.Router() em vez de express()
const db = require('../models/db');
require('dotenv').config({path:'variaveis.env'});


const usuariosController = require('./controllers/usuarioController.js'); // Aqui estava usuario_controller, corrigido para usuariosController

router.get("/", async (req, res) => {
    res.send("página inicial");
    });


router.use(express.json());

// Rotas para manipulação de usuários
router.get('/getAllUsers', usuariosController.getAllUsers); 
router.get('/showUser', usuariosController.showUser); //
router.post('/newUser', usuariosController.newUser); // 
router.put('/updateUser/:id', usuariosController.updateUser); // 
router.delete('/deleteUser/:id', usuariosController.deleteUser); //
router.post('/login', usuariosController.login);

const atividadesController = require('./controllers/atividadesController.js');

// Rotas para manipulação de atividades
//router.get('/atividade/:id', atividadesController.buscarUma);

router.get('/showActivity', atividadesController.showActivity);
router.post('/newActivity', atividadesController.newActivity);
router.put('/updateActivity/:id', atividadesController.updateActivity);
router.delete('/deleteActivity/:id', atividadesController.deleteActivity);

module.exports = router;

const app = express();