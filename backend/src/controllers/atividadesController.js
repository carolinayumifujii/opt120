const database = require('../../models/db');

class AtividadeController {
   
    newActivity(req, res){
        const {titulo, descricao, nota, data_atv} = req.body

        database.query('INSERT INTO opt120.atividade (titulo, descricao, nota, data_atv) VALUES (?, ?, ?, ?)', [titulo, descricao, nota, data_atv], (err, results) => {
            if (err) {
                console.error(err);
                res.status(500).json({ error: 'Erro interno do servidor' });
                return;
            }
            res.json(results);
        });
    }

    showActivity(req, res){
        const query = 'SELECT * FROM opt120.atividade';
    
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

    deleteActivity(req, res){
        const { id } = req.params;
        database.query('DELETE FROM opt120.atividade WHERE id = ?', [id], (err, results) => {
            if (err) throw err;
            res.json(results);
        });
    }

    updateActivity(req, res){
        const {titulo, descricao, nota, data_atv} = req.body;
        const {id} = req.params;
        database.query('UPDATE opt120.atividade SET titulo = ?, descricao = ? WHERE id = ?', [titulo, descricao, id], (err, results) => {
            if (err) throw err;
            res.json(results);
          });
    }


}


module.exports = new AtividadeController