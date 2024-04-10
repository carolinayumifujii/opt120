const db = require("../db.js");

// Defina o serviço de usuário
const UsuarioService = {
  // Função para obter todos os usuários
  async getAllUsuarios() {
    try {
      const usuarios = await db.query("SELECT * FROM  opt120.usuario");
      return usuarios;
    } catch (error) {
      throw new Error("Erro ao obter usuários do banco de dados");
    }
  },

  // Função para obter um usuário pelo ID
  async getUsuarioById(id) {
    try {
      const usuario = await db.query("SELECT * FROM opt120.usuario WHERE id = ?", [id]);
      return usuario[0];
    } catch (error) {
      throw new Error("Erro ao obter usuário do banco de dados");
    }
  },

  // Função para adicionar um novo usuário
  async addUsuario(nome, email, senha) {
    try {
      await db.query("INSERT INTO opt120.usuario (nome, email, senha) VALUES (?, ?, ?)", [nome, email, senha]);
    } catch (error) {
      throw new Error("Erro ao adicionar usuário ao banco de dados");
    }
  },

  // Função para atualizar um usuário existente
  async updateUsuario(id, nome, email, senha) {
    try {
      await db.query("UPDATE opt120.usuario SET nome = ?, email = ?, senha = ? WHERE id = ?", [nome, email, senha, id]);
    } catch (error) {
      throw new Error("Erro ao atualizar usuário no banco de dados");
    }
  },

  // Função para deletar um usuário pelo ID
  async deleteUsuario(id) {
    try {
      await db.query("DELETE FROM opt120.usuario WHERE id = ?", [id]);
    } catch (error) {
      throw new Error("Erro ao deletar usuário do banco de dados");
    }
  }
};

// Exporte o serviço de usuário
module.exports = UsuarioService;
