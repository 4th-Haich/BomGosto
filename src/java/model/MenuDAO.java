package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO{
    public void inserir(Menu m) throws Exception {
        conectar();
        String sql = "INSERT INTO menu (titulo,link,icone) VALUES(?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getTitulo());
        pstm.setString(2, m.getLink());
        pstm.setString(3, m.getIcone());
        pstm.execute();
        desconectar();
    }
    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        conectar();
        String sql = "SELECT * FROM menu";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {            
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        desconectar();
        return lista;
    }

    public void alterar(Menu m) throws Exception{
        conectar();
        String sql = "UPDATE menu SET titulo=?,link=?,icone=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getTitulo());
        pstm.setString(2, m.getLink());
        pstm.setString(3, m.getIcone());
        pstm.setInt(4, m.getId());
        pstm.execute();
        desconectar();
    }

    /*public void excluir(Menu m) throws Exception{
        conectar();
        String sql = "DELETE FROM menu WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, m.getId());
        pstm.execute();
        desconectar();
    }*/
    
    public Menu carregaPorId(int id) throws Exception {
        Menu m = new Menu();
        conectar();
        String sql = "SELECT * FROM menu WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {            
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
        }
        desconectar();
        return m;
    }
}
