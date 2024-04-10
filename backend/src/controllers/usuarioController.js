const database = require('../../models/db');
//const database = require('../models/db');

class UsuarioController {
    newUser(req, res){
      const {nome, email, senha} = req.body
      database.query('INSERT INTO opt120.usuario (nome, email, senha) VALUES (?, ?, ?)', [nome, email, senha], (err, results) => {
          if (err) throw err;
          res.json(results);
      });
  
  }
  // Método para verificar as credenciais do usuário
  checkCredentials(email, senha, callback) {
    const query = 'SELECT * FROM opt120.usuario WHERE email = ? AND senha = ?';
    database.query(query, [email, senha], (error, results) => {
      if (error) {
        return callback(error, null);
      }
      
      if (results.length > 0) {
        // Se encontrar um usuário com o e-mail e senha fornecidos, retorne os dados do usuário
        return callback(null, results[0]);
      } else {
        // Se não encontrar nenhum usuário, retorne null
        return callback(null, null);
      }
    });
  }


    showUser(req, res){
        const query = 'SELECT * FROM opt120.usuario';
    
        database.query(query, (error, results) => {
            if (error) {
                console.error(error);
                res.status(500).json({ error: 'Erro interno do servidor' });
                return;
            }
            
            console.log(results);
            res.json(results);
        });
    }

    deleteUser(req, res){
        const { id } = req.params;
        database.query('DELETE FROM opt120.usuario WHERE id = ?', [id], (err, results) => {
            if (err) throw err;
            res.json(results);
        });
    }

    updateUser(req,res){
        const {nome, email, senha} = req.body;
        const {id} = req.params;
        database.query('UPDATE opt120.usuario SET nome = ?, email = ? WHERE id = ?', [nome, email, id], (err, results) => {
            if (err) throw err;
            res.json(results);
          });

    }

getAllUsers(req, res) {
  const query = 'SELECT * FROM opt120.usuario';
    
  database.query(query, (error, results) => {
    if (error) {
        console.error('Erro ao buscar todos os usuários:', error);
        res.status(500).json({ error: 'Erro interno do servidor' });
        return;
      }
        
      console.log('Usuários encontrados:', results); // Verifique se os resultados estão corretos
      res.json(results);
  });
}
}

module.exports = new UsuarioController