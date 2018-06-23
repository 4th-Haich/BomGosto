package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PedidoDAO extends DataBaseDAO {

    public Pedido inserir(Pedido p, ArrayList carrinho) throws Exception {
        conectar();
        String sql = "INSERT INTO pedido (data_pedido,obs,status,tipo_pagamento,preco_final,cliente_id,usuario_id) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        pstm.setString(1, p.getDataPedido());
        pstm.setString(2, p.getObs());
        pstm.setString(3, p.getStatus());
        pstm.setString(4, p.getTipoPagamento());
        pstm.setDouble(5, p.getPrecoFinal());
        pstm.setInt(6, p.getCliente().getId());
        pstm.setInt(7, p.getUsuario().getId());
        int affectedRows = pstm.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Erro ao inserir pedido, sem linhas afetadas.");
        }
        try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                p.setId(generatedKeys.getInt(1));
                if (p.getId() != 0) {
                    for (int i = 0; i < carrinho.size(); i++) {                        
                        Carrinho ca = (Carrinho) carrinho.get(i);
                        this.inserirProduto(ca, p.getId());
                    }
                }
            } else {
                throw new SQLException("Erro ao inserir pedido, não foi obtido ID.");
            }
        }
        desconectar();
        return p;
    }

    public void inserirProduto(Carrinho ca, int id) throws Exception {        
        conectar();
        String sql = "INSERT INTO pedido_produto (pedido_id,produto_id,qtd,tamanho,preco_pedido) VALUES(?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.setInt(2, ca.getProduto().getId());
        pstm.setInt(3, ca.getQtd());
        pstm.setString(4, ca.getTamanho());
        pstm.setDouble(5, ca.getPrecoUnitario());
        pstm.execute();
        desconectar();
    }

    public ArrayList<Pedido> listar() throws Exception {
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        conectar();
        String sql = "SELECT * FROM pedido";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Pedido p = new Pedido();
            p.setId(rs.getInt("id"));
            p.setDataPedido(rs.getString("data_pedido"));
            p.setObs(rs.getString("obs"));
            p.setStatus(rs.getString("status"));
            p.setTipoPagamento(rs.getString("tipo_pagamento"));
            p.setPrecoFinal(rs.getDouble("preco_final"));
            ClienteDAO cDAO = new ClienteDAO();
            p.setCliente(cDAO.carregaPorId(rs.getInt("cliente_id")));
            UsuarioDAO uDAO = new UsuarioDAO();
            p.setUsuario(uDAO.carregaPorId(rs.getInt("usuario_id")));
            lista.add(p);
        }
        desconectar();
        return lista;
    }

    public void alterar(Pedido p) throws Exception {
        conectar();
        String sql = "UPDATE pedido SET data_pedido=?,obs=?,status=?,tipo_pagamento=?,preco_final=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getDataPedido());
        pstm.setString(2, p.getObs());
        pstm.setString(3, p.getStatus());
        pstm.setString(4, p.getTipoPagamento());
        pstm.setDouble(5, p.getPrecoFinal());
        pstm.setInt(6, p.getId());
        pstm.execute();
        desconectar();
    }

    public Pedido carregaPorId(int id) throws Exception {
        Pedido p = new Pedido();
        conectar();
        String sql = "SELECT * FROM pedido WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setDataPedido(rs.getString("data_pedido"));
            p.setObs(rs.getString("obs"));
            p.setStatus(rs.getString("status"));
            p.setTipoPagamento(rs.getString("tipo_pagamento"));
            p.setPrecoFinal(rs.getDouble("preco_final"));
            ClienteDAO cDAO = new ClienteDAO();
            p.setCliente(cDAO.carregaPorId(rs.getInt("cliente_id")));
            UsuarioDAO uDAO = new UsuarioDAO();
            p.setUsuario(uDAO.carregaPorId(rs.getInt("usuario_id")));
        }
        desconectar();
        return p;
    }

    public ArrayList<Pedido> carregaPorCliente(int id) throws Exception {
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        conectar();
        String sql = "SELECT * FROM pedido WHERE cliente_id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Pedido p = new Pedido();
            p.setId(rs.getInt("id"));
            p.setDataPedido(rs.getString("data_pedido"));
            p.setObs(rs.getString("obs"));
            p.setStatus(rs.getString("status"));
            p.setTipoPagamento(rs.getString("tipo_pagamento"));
            p.setPrecoFinal(rs.getDouble("preco_final"));
            ClienteDAO cDAO = new ClienteDAO();
            p.setCliente(cDAO.carregaPorId(rs.getInt("cliente_id")));
            UsuarioDAO uDAO = new UsuarioDAO();
            p.setUsuario(uDAO.carregaPorId(rs.getInt("usuario_id")));
            lista.add(p);
        }
        desconectar();
        return lista;
    }

    public void alteraStatus(Pedido p) throws Exception {
        conectar();
        String sql = "UPDATE pedido SET status=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getStatus());
        pstm.setInt(2, p.getId());
        pstm.execute();
        desconectar();
    }

}
