//importa o arquivo mysql
const mysql = require("../mysql");

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
        return res.status(500).send({ "Mensagem": error });
    }

};


exports.cadastrarUsuario = async (req, res) => {
    try {
        const resultado = await mysql.execute(
            `INSERT INTO users (first_name, last_name, email, password, birth_date, phone)
		VALUES (?, ?, ?, ?, ?, ?);`,
            [
                req.body.first_name,
                req.body.last_name,
                req.body.email,
                req.body.password,
                req.body.birth_date,
                req.body.phone
            ]
        );

        return res.status(201).send({
            "Mensagem": "Usuário cadastrado com sucesso!",
            "Resultado ": resultado
        });

    } catch (error) {
        console.log("Erro ao cadastrar o usuário: ", error);
        return res.status(500).send({ "Mensagem": error });
    }
};
