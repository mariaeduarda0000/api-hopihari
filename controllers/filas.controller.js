const mysql = require("../mysql");

//Function que verifica se o id do brinquedo passado existe
exports.verificarBrinquedo = async (req, res, next) => {
    try {
        const resultado = await mysql.execute(
            `SELECT * FROM rides WHERE id = ?`,
            [req.params.idRide]
        );

        if (resultado.length == 0) {
            return res.status(404).send({ "Mensagem": "Brinquedo não encontrado" });
        }

        next();
    } catch (error) {
        return res.status(500).send(error);
    }
}


exports.entrarFila = async (req, res) => {
    try {
        const resultados = await mysql.execute(
            `INSERT INTO hopihari_db.lines (id_users, id_rides) VALUES(?, ?)`,

            [res.locals.idusuario, Number(req.params.idRide)]);
        return res.status(201).send({ "Mensagem": "Usuário adicionado a fila com sucesso", "Resultado": resultados });
    } catch (error) {
        return res.status(500).send(error)
    }
}
