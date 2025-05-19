const jwt = require("jsonwebtoken");


exports.required = async(req, res, next) =>{
    try{
        res.locals.idusuario = 0;

        const token = req.headers.authorization.split(" ")[1];
        const decode = jwt.decode(token, "senhadojwt");

        if (decode.id){
            res.locals.idusuario = decode.id;
            next();
        }else{
            return res.status(401).send({"Mensagem": "Usuário não autenticado"});
        }

    }catch(error){
        return res.status(500).send(error);
    }
}
