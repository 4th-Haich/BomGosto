package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {

    public void inserir(Usuario u) throws Exception {
        conectar();
        String sql = "INSERT INTO usuario (nome,telefone,cpf,senha,perfil_id) VALUES(?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, u.getNome());
        pstm.setString(2, u.getTelefone());        
        pstm.setString(3, u.getCpf());
        pstm.setString(4, u.getSenha());
        pstm.setInt(5, u.getPerfil().getId());
        pstm.execute();
        desconectar();
    }

    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        conectar();
        String sql = "SELECT * FROM usuario";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {            
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setTelefone(rs.getString("telefone"));              
            u.setCpf(rs.getString("cpf"));
            u.setSenha(rs.getString("senha"));
            PerfilDAO pDAO = new PerfilDAO();
            u.setPerfil(pDAO.carregaPorId(rs.getInt("perfil_id")));
            lista.add(u);
        }
        desconectar();
        return lista;
    }
    
    public void alterar(Usuario u) throws Exception {
        conectar();
        String sql = "UPDATE usuario SET nome=?,telefone=?,cpf=?,senha=?,perfil_id=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, u.getNome());
        pstm.setString(2, u.getTelefone());        
        pstm.setString(3, u.getCpf());
        pstm.setString(4, u.getSenha());
        pstm.setInt(5, u.getPerfil().getId());
        pstm.setInt(6, u.getId());
        pstm.execute();
        desconectar();
    }
    
    /*public void excluir(Usuario u) throws Exception {
        conectar();
        String sql = "DELETE FROM usuario WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
         pstm.setInt(1, u.getId());
        pstm.execute();
        desconectar();
    }*/
    
    public Usuario carregaPorId(int id) throws Exception {
        Usuario u = new Usuario();
        conectar();
        String sql = "SELECT * FROM usuario WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {            
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome")); 
            u.setTelefone(rs.getString("telefone"));   
            u.setCpf(rs.getString("cpf"));
            u.setSenha(rs.getString("senha"));
            PerfilDAO pDAO = new PerfilDAO();
            u.setPerfil(pDAO.carregaPorId(rs.getInt("perfil_id")));
        }
        desconectar();
        return u;
    }

    public Usuario logar(String cpf, String senha) throws Exception {
        Usuario u = new Usuario();
        conectar();
        String sql = "SELECT * FROM usuario WHERE cpf=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpf);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {            
            if (senha.equals(rs.getString("senha"))) {
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setCpf(rs.getString("cpf"));
                u.setSenha(rs.getString("senha"));
                PerfilDAO pDAO = new PerfilDAO();
                u.setPerfil(pDAO.carregaPorId(rs.getInt("perfil_id")));
            }
        }
        desconectar();
        return u;
    }
    public boolean verificar(String cpf) throws Exception{        
        boolean verif = false;
        conectar();
        String sql = "SELECT * FROM usuario WHERE cpf=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpf);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {            
            if (cpf.equals(rs.getString("cpf"))) {
                verif = true;
            }
        }
        desconectar();
        return verif;
    }
}
