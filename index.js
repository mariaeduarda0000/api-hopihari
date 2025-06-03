const express = require("express");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");
const helmet = require("helmet")

//rota para o arquivo de usuários
const usuariosRoute = require("./routes/usuarios.route");
const filasRoute = require("./routes/filas.routes");
const notificationRoute = require("./routes/notification.route");
const brinquedosRoute = require("./routes/brinquedos.route");


//middleware = processa req antes de chegar na rota 
app.use(cors());
app.use(helmet());

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());


//middleware para permitir o acessso a API
app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
        "Access-Control-Allow-Headers", 
        "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    );
    if (req.method === 'OPTIONS') {
        res.header("Access-Control-Allow-Methods", "PUT, POST, GET, PATCH, DELETE");
    }
    next();
});

app.use("/usuarios", usuariosRoute);
app.use("/filas",filasRoute);
app.use("/notifications", notificationRoute);
app.use("/brinquedos", brinquedosRoute);
    
module.exports = app;
