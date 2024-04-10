const db = require("../../models/db.js");

// Defina o serviço de atividade
const AtividadeService = {
  // Função para obter todas as atividades
  async getAllAtividades() {
    try {
      const atividades = await db.query("SELECT * FROM opt120.atividade");
      return atividades;
    } catch (error) {
      throw new Error("Erro ao obter atividades do banco de dados");
    }
  },

  // Função para obter uma atividade pelo ID
  async getAtividadeById(id) {
    try {
      const atividade = await db.query("SELECT * FROM  opt120.atividade WHERE id = ?", [id]);
      return atividade[0];
    } catch (error) {
      throw new Error("Erro ao obter atividade do banco de dados");
    }
  },

  // Função para adicionar uma nova atividade
  async addAtividade(titulo, descricao, data) {
    try {
      await db.query("INSERT INTO  opt120.atividade (titulo, descricao, data) VALUES (?, ?, ?)", [titulo, descricao, data]);
    } catch (error) {
      throw new Error("Erro ao adicionar atividade ao banco de dados");
    }
  },

  // Função para atualizar uma atividade existente
  async updateAtividade(id, titulo, descricao, data) {
    try {
      await db.query("UPDATE  opt120.atividade SET titulo = ?, descricao = ?, data = ? WHERE id = ?", [titulo, descricao, data, id]);
    } catch (error) {
      throw new Error("Erro ao atualizar atividade no banco de dados");
    }
  },

  // Função para deletar uma atividade pelo ID
  async deleteAtividade(id) {
    try {
      await db.query("DELETE FROM opt120.atividade WHERE id = ?", [id]);
    } catch (error) {
      throw new Error("Erro ao deletar atividade do banco de dados");
    }
  }
};

// Exporte o serviço de atividade
module.exports = AtividadeService;
