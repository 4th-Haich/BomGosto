package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {

    public void inserir(Cliente c) throws Exception {
        conectar();
        String sql = "INSERT INTO cliente (nome,telefone,cep,cidade,endereco,num_casa,complemento,login,senha) VALUES(?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getTelefone());
        pstm.setString(3, c.getCep());
        pstm.setString(4, c.getCidade());
        pstm.setString(5, c.getEndereco());
        pstm.setString(6, c.getNumCasa());
        pstm.setString(7, c.getComplemento());
        pstm.setString(8, c.getLogin());
        pstm.setString(9, c.getSenha());
        pstm.execute();
        desconectar();
    }

    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        conectar();
        String sql = "SELECT * FROM cliente";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setCep(rs.getString("cep"));
            c.setCidade(rs.getString("cidade"));
            c.setEndereco(rs.getString("endereco"));
            c.setNumCasa(rs.getString("num_casa"));
            c.setComplemento(rs.getString("complemento"));
            c.setLogin(rs.getString("login"));
            c.setSenha(rs.getString("senha"));
            lista.add(c);
        }
        desconectar();
        return lista;
    }

    public void alterar(Cliente c) throws Exception {
        conectar();
        String sql = "UPDATE cliente SET nome=?,telefone=?,cep=?,cidade=?,endereco=?,num_casa=?,complemento=?,login=?,senha=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getTelefone());
        pstm.setString(3, c.getCep());
        pstm.setString(4, c.getCidade());
        pstm.setString(5, c.getEndereco());
        pstm.setString(6, c.getNumCasa());
        pstm.setString(7, c.getComplemento());
        pstm.setString(8, c.getLogin());
        pstm.setString(9, c.getSenha());
        pstm.setInt(10, c.getId());
        pstm.execute();
        desconectar();
    }
    public void alterarSenha(String login, String senha) throws Exception {
        conectar();
        String sql = "UPDATE cliente SET senha=? WHERE login=?";
        PreparedStatement pstm = conn.prepareStatement(sql);       
        pstm.setString(1, senha); 
        pstm.setString(2, login);               
        pstm.execute();
        desconectar();
    }

    /*public void excluir(Cliente c) throws Exception {
        conectar();
        String sql = "DELETE FROM cliente WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, c.getId());
        pstm.execute();
        desconectar();
    }*/

    public Cliente carregaPorId(int id) throws Exception {
        Cliente c = new Cliente();
        conectar();
        String sql = "SELECT * FROM cliente WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            c.setCep(rs.getString("cep"));
            c.setCidade(rs.getString("cidade"));
            c.setEndereco(rs.getString("endereco"));
            c.setNumCasa(rs.getString("num_casa"));
            c.setComplemento(rs.getString("complemento"));
            c.setLogin(rs.getString("login"));
            c.setSenha(rs.getString("senha"));
        }
        desconectar();
        return c;
    }

    public Cliente logar(String login, String senha) throws Exception {
        Cliente c = new Cliente();
        conectar();
        String sql = "SELECT * FROM cliente WHERE login=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setLogin(rs.getString("login"));
                c.setSenha(rs.getString("senha"));
            }
        }
        desconectar();
        return c;
    }

    public boolean verificar(String login) throws Exception {
        boolean verif = false;
        Cliente c = new Cliente();
        conectar();
        String sql = "SELECT * FROM cliente WHERE login=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (login.equals(rs.getString("login"))) {
                verif = true;                
            }
        }
        desconectar();
        return verif;
    }    
}
