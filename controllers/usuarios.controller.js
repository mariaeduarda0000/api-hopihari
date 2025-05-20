//importa o arquivo mysql
const mysql = require("../mysql");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

// Função para atualizar o usuário
exports.atualizarUsuario = async (req, res) => {
    try {
        const idUsuário = Number(req.params.id);
        const resultado = await mysql.execute(
            `UPDATE users
                SET first_name  = ?,
                    last_name   = ?,
                    email = ?,
                    password = ?,
                    birth_date = ?,
                    phone = ?
	         WHERE id = ?;`,
            [
                req.body.first_name,
                req.body.last_name,
                req.body.email,
                req.body.password,
                req.body.birth_date,
                req.body.phone,
                idUsuário
            ]
        );
        

        return res.status(201).send({
            "Mensagem": "Usuário atualizado com sucesso!",
            "Resultado ": resultado
        });

    } catch (error) {
        return res.status(500).send (error);
    }

};


exports.cadastrarUsuario = async (req, res) => {
    try {
         const {email,password, first_name, last_name, phone, birth_date} = req.body;

        const hash = await bcrypt.hash(req.body.password, 10);
        const resultado = await mysql.execute(
            `INSERT INTO users (first_name, last_name, email, password, birth_date, phone)
		VALUES (?, ?, ?, ?, ?, ?);`,
            [
                first_name,
                last_name,
                email,
                hash,
                birth_date,
                phone
            ]
        );

        return res.status(201).send({
            "Mensagem": "Usuário cadastrado com sucesso!",
            "Resultado ": resultado
        });

    } catch (error) {
        console.log("Erro ao cadastrar o usuário: ", error);
        return res.status(500).send(error);
    }
};


exports.login = async (req, res) => {
    try{

        const usuario = await mysql.execute(
            `SELECT * FROM users WHERE email = ? `, 
            [req.body.email]);

      

        if(usuario.length == 0){
            return res.status(401).send({ "Mensagem": "Usuário não cadastrado!" });
        }

        const match = await bcrypt.compare(req.body.password, usuario[0].password);

        //se o match for falso, retorna uma mensagem de erro
        if(!match){
            return res.status(401).send({ "Mensagem": "Senha inválida!" });
        }

        //gera um token com os dados passados no baanco
        const token =  jwt.sign({
            id: usuario[0].id,
            first_name: usuario[0].first_name,
            last_name: usuario[0].last_name,
            email: usuario[0].email,
            birth_date: usuario[0].birth_date,
            phone: usuario[0].phone,
            admin: usuario[0].admin
        }, "senhadojwt");
        return res.status(200). send({
            "Mensagem": "Usuário logado com sucesso!",
            "Token": token,
            "Resultado ": usuario
        })


    }catch(error){
        return res.status(500).send(error);
    }};
