const mysql = require('mysql2');
/*
const Sequelize = require('sequelize');
const sequelize = new Sequelize("opt120", "root", "root", {
    host: 'localhost',
    dialect: 'mysql'

});

sequelize.authenticate()
.then(function(){
    console.log("Conexão com o banco de dados realizada com sucesso!");
}).catch(function(){
    console. log ("Erro: Conexão com o banco de dados não realizada com sucesso!");
});


module.exports = sequelize;
*/

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

connection.connect((error)=>{
    if(error) throw error;
    console.log(`Conectado ao Banco de Dados: ${process.env.DB_NAME}`)
});
/*
async function selectUsuario () {
    const conn = await connect () ;
    const [rows] = await conn.query ('SELECT * FROM usuario; ');
    return
}
*/
module.exports = connection;
