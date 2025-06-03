const jwt = require("jsonwebtoken");

// Função para autenticar o usuário
exports.required = async(req, res, next) =>{
    try{
        res.locals.idusuario = 0;
        res.locals.admin = 0;

        const token = req.headers.authorization.split(" ")[1];
        const decode = jwt.decode(token, "senhadojwt");

        if (decode.id){
            res.locals.idusuario = decode.id;
            res.locals.admin = decode.admin;
            next();
        }else{
            return res.status(401).send({"Mensagem": "Usuário não autenticado"});
        }

    }catch(error){
        return res.status(500).send(error);
    }
}

// Função para verificar se o usuário é um admin
exports.userRequired = async(req, res, next) =>{

    try{
        if(!res.locals.admin){
            return res.status(405).send({"Mensagem": "Usuário não autorizado"});
        }
        next();

    }catch (error){
        return res.status(500).send(error);
    }

}
