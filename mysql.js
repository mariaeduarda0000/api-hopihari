//Conexão com o banco de dados myslq
const mysql2 = require('mysql2');

//Cria a conexão através dos dados passados
const connection = mysql2.createConnection({
    host: "localhost",
    password: "root",
    user: "root",
    port: 3307,
    database: "hopi_hari_db"
});

//Conecta ao banco
exports.execute = (query, param =[], pool = connection) => { 
    return new Promise((resolve, reject) => {
        pool.query(query, param, (error, results) => {
            if(error){
                reject(error);
            }else{
                resolve(results);
            }
        });
    });
}
