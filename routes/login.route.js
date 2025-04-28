const express = require("express");
const router = express.Router();

router.post('/login', () =>{console.log("Rota de login")});
router.post('/cadastrar', () =>{console.log("Rota de cadastro")});
router.put('/atualizar', () =>{console.log("Rota para atualizar usuário")});


module.exports = router;