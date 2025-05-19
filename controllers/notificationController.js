const mysql = require('../mysql');

exports.notification = async (req, res) => {
    try {

        const resultado = await mysql.execute(
            `select * from notifications where status = true
            AND id_users = ?;`,
            
            [res.locals.idusuario]
        );
        
        return res.status(201).send({
            "Mensagem": "As notificações estão funcionando",
            "Resultado ": resultado
        });

    } catch (error) {
        return res.status(500).send(error);
    }

};