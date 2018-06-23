package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProdutoDAO extends DataBaseDAO {

    public void inserir(Produto p) throws Exception {
        conectar();
        String sql = "INSERT INTO produto (nome,preco_unitario,imagem,categoria_id) VALUES(?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());        
        pstm.setDouble(2, p.getPrecoUnitario());
        pstm.setString(3, p.getImagem());
        pstm.setInt(4, p.getCategoria().getId());
        pstm.execute();
        desconectar();
    }

    public ArrayList<Produto> listar() throws Exception {
        ArrayList<Produto> lista = new ArrayList<Produto>();
        conectar();
        String sql = "SELECT * FROM produto";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));            
            p.setPrecoUnitario(rs.getDouble("preco_unitario"));
            p.setImagem(rs.getString("imagem"));
            CategoriaDAO cDAO = new CategoriaDAO();
            p.setCategoria(cDAO.carregaPorId(rs.getInt("categoria_id")));
            lista.add(p);
        }
        desconectar();
        return lista;
    }

    public void alterar(Produto p) throws Exception {
        conectar();
        String sql = "UPDATE produto SET nome=?,preco_unitario=?,imagem=?,categoria_id=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());        
        pstm.setDouble(2, p.getPrecoUnitario());
        pstm.setString(3, p.getImagem());
        pstm.setInt(4, p.getCategoria().getId());
        pstm.setInt(5, p.getId());
        pstm.execute();
        desconectar();
    }

    /*public void excluir(Produto p) throws Exception {
        conectar();
        String sql = "DELETE FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, p.getId());
        pstm.execute();
        desconectar();
    }*/
    public Produto carregaPorId(int id) throws Exception {
        Produto p = new Produto();
        conectar();
        String sql = "SELECT * FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));            
            p.setPrecoUnitario(rs.getDouble("preco_unitario"));
            p.setImagem(rs.getString("imagem"));
            CategoriaDAO cDAO = new CategoriaDAO();
            p.setCategoria(cDAO.carregaPorId(rs.getInt("categoria_id")));
        }
        desconectar();
        return p;
    }

    public ArrayList<Produto> carregaPedidoProduto(int id) throws Exception {
        ArrayList<Produto> lista = new ArrayList<Produto>();
        conectar();
        String sql = "SELECT * FROM produto as p, pedido_produto as pp WHERE p.id=pp.produto_id AND pp.pedido_id=? ORDER BY `nome` ASC";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setTamanho(rs.getString("tamanho"));            
            p.setPrecoUnitario(rs.getDouble("preco_unitario"));
            p.setImagem(rs.getString("imagem"));
            p.setQtd(rs.getInt("qtd"));
            CategoriaDAO cDAO = new CategoriaDAO();
            p.setCategoria(cDAO.carregaPorId(rs.getInt("categoria_id")));
            lista.add(p);
        }
        desconectar();
        return lista;
    }
}
