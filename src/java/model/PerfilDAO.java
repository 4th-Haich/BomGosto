package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PerfilDAO extends DataBaseDAO {

    public void inserir(Perfil p) throws Exception {
        conectar();
        String sql = "INSERT INTO perfil (nome,descricao) VALUES(?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.execute();
        desconectar();
    }
    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        conectar();
        String sql = "SELECT * FROM perfil";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {            
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            lista.add(p);
        }
        desconectar();
        return lista;
    }

    public void alterar(Perfil p) throws Exception{
        conectar();
        String sql = "UPDATE perfil SET nome=?,descricao=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.setInt(3, p.getId());
        pstm.execute();
        desconectar();
    }

    /*public void excluir(Perfil p) throws Exception{
        conectar();
        String sql = "DELETE FROM perfil WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, p.getId());
        pstm.execute();
        desconectar();
    }*/
    
    public Perfil carregaPorId(int id) throws Exception {
        Perfil p = new Perfil();
        conectar();
        String sql = "SELECT * FROM perfil WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {            
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setListaMenu(this.carregaMenusPerfil(id));
        }
        desconectar();
        return p;
    }
    
    public ArrayList<Menu> carregaMenusPerfil(int perfil_id) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        conectar();
        String sql = "SELECT m.* FROM menu as m, perfil_menu as mp WHERE m.id=mp.menu_id AND mp.perfil_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
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
    public ArrayList<Menu> carregaMenusNaoPerfil(int perfil_id) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        conectar();
        String sql = "SELECT * FROM menu WHERE id NOT IN(SELECT menu_id FROM perfil_menu WHERE perfil_id=?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
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

    public void vincularMenu(int perfil_id, int menu_id) throws Exception{
    conectar();
        String sql = "INSERT INTO perfil_menu (perfil_id,menu_id) VALUES(?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        pstm.setInt(2, menu_id);
        pstm.execute();
        desconectar();
    }

    public void desvincularMenu(int perfil_id, int menu_id) throws Exception{
        conectar();
        String sql = "DELETE FROM perfil_menu WHERE perfil_id=? AND menu_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, perfil_id);
        pstm.setInt(2, menu_id);
        pstm.execute();
        desconectar();
    }
    
}
