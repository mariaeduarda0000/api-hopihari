const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const helmet = require("helmet")

//rota para o arquivo de usuários
const usuariosRoute = require("./routes/usuarios.route");
const filasRoute = require("./routes/filas.routes");


//middleware = processa req antes de chegar na rota 
app.use(cors());
app.use(helmet());

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());


//middleware para permitir o acessso a API
app.use((req, res, next) => {
    res.header("Acess-Control-Allow-Origins", "*");
    res.header("Acess-Control-Allow-Headers", 
        "Origin, X-Requested-With, Content-type, Accept, Authorization")
    if (req.method === 'Options'){
        res.header("Acess-Control-Allow-Methods", "PUT, POST, GET, PATCH, DELETE");
    }
    next();

});

app.use("/usuarios", usuariosRoute);
app.use("/filas",filasRoute)

module.exports = app;
