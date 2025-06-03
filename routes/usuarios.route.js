const express = require("express");
const router = express.Router();   
const usuariosController = require("../controllers/usuarios.controller");
const login = require("../middleware/usuarios.middleware");

//rotas para ultilizar as funções criadas no controller
router.post('/login', usuariosController.login);
router.put('/', login.required, usuariosController.atualizarUsuario);
router.post('/', usuariosController.cadastrarUsuario);



module.exports = router;
