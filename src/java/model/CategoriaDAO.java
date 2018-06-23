package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoriaDAO extends DataBaseDAO{

     public void inserir(Categoria c) throws Exception {
        conectar();
        String sql = "INSERT INTO categoria (nome) VALUES(?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.execute();
        desconectar();
    }

    public ArrayList<Categoria> listar() throws Exception {
        ArrayList<Categoria> lista = new ArrayList<Categoria>();
        conectar();
        String sql = "SELECT * FROM categoria";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {            
            Categoria c = new Categoria();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            lista.add(c);
        }
        desconectar();
        return lista;
    }
    
    public void alterar(Categoria c) throws Exception {
        conectar();
        String sql = "UPDATE categoria SET nome=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setInt(2, c.getId());
        pstm.execute();
        desconectar();
    }
    
    /*public void excluir(Categoria c) throws Exception {
        conectar();
        String sql = "DELETE FROM categoria WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, c.getId());
        pstm.execute();
        desconectar();
    }*/
    
    public Categoria carregaPorId(int id) throws Exception {
        Categoria c = new Categoria();
        conectar();
        String sql = "SELECT * FROM categoria WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {            
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
        }
        desconectar();
        return c;
    }   
}

    

