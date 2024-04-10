const database = require('../../models/db');

// Adicionar um novo registro de usuário em uma atividade
export const adicionarAtividadeUsuario = (req, res) => {
  const query =
    "INSERT INTO opt120.usuario_atividade (`usuario_id`, `atividade_id`, `entrega`, `nota`) VALUES (?, ?, ?, ?)";

  const values = [
    req.body.usuario_id,
    req.body.atividade_id,
    req.body.entrega,
    req.body.nota,
  ];

  db.query(query, values, (err) => {
    if (err) {
      return res.status(500).json({ error: "Erro ao adicionar usuário à atividade" });
    }

    return res.status(201).json("Usuário adicionado à atividade com sucesso.");
  });
};

// Atualizar um registro de usuário em uma atividade existente
export const atualizarAtividadeUsuario = (req, res) => {
  const query =
    "UPDATE opt120.usuario_atividade SET `entrega` = ?, `nota` = ? WHERE `usuario_id` = ? AND `atividade_id` = ?";

  const values = [
    req.body.entrega,
    req.body.nota,
    req.params.usuario_id,
    req.params.atividade_id,
  ];

  db.query(query, values, (err) => {
    if (err) {
      return res.status(500).json({ error: "Erro ao atualizar registro de usuário em atividade" });
    }

    return res.status(200).json("Registro de usuário em atividade atualizado com sucesso.");
  });
};

// Deletar um registro de usuário em uma atividade existente
export const deletarAtividadeUsuario = (req, res) => {
  const query = "DELETE FROM opt120.usuario_atividade WHERE `usuario_id` = ? AND `atividade_id` = ?";

  const values = [req.params.usuario_id, req.params.atividade_id];

  db.query(query, values, (err) => {
    if (err) {
      return res.status(500).json({ error: "Erro ao deletar registro de usuário em atividade" });
    }

    return res.status(200).json("Registro de usuário em atividade deletado com sucesso.");
  });
};
