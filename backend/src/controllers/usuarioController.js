const database = require('../../models/db');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');


class UsuarioController {
    newUser(req, res){
        const { nome, email, senha } = req.body;
        const hashedSenha = bcrypt.hashSync(senha, 10); // Hash da senha

        database.query('INSERT INTO opt120.usuario (nome, email, senha) VALUES (?, ?, ?)', [nome, email, hashedSenha], (err, results) => {
            if (err) throw err;
            res.json(results);
        });
  
    }
    login(req, res) {
        const email = req.body.email;
        const senha = req.body.senha;

        database.query('SELECT * FROM opt120.usuario WHERE email = ?', [email], (err, results) => {
            if (err) {
                console.error(err);
                res.status(500).json({ error: 'Erro interno do servidor' });
                return;
            }

            if (results.length === 0) {
                res.status(401).json({ error: 'Credenciais inválidas' });
                return;
            }

            const usuario = results[0];
            const senhaCorreta = bcrypt.compareSync(senha, usuario.senha);

            if (!senhaCorreta) {
                res.status(401).json({ error: 'Senha inválida' });
                return;
            }

            const token = jwt.sign({ id: usuario.id }, 'chave-secreta');
            res.json({ token });
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