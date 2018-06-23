package model;

import java.util.ArrayList;

public class Pedido {

    private int id;
    private String dataPedido;
    private String obs;
    private String status;
    private String tipoPagamento;
    private double precoFinal;
    private Cliente cliente;
    private Usuario usuario;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(String dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    public double getPrecoFinal() {
        return precoFinal;
    }

    public void setPrecoFinal(double precoFinal) {
        this.precoFinal = precoFinal;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Pedido inserir(ArrayList carrinho) throws Exception {
        PedidoDAO pDAO = new PedidoDAO();        
        return pDAO.inserir(this,carrinho);
    }

    public void alterar() throws Exception {
        PedidoDAO pDAO = new PedidoDAO();
        pDAO.alterar(this);
    }

    public ArrayList<Pedido> listar() throws Exception {
        PedidoDAO pDAO = new PedidoDAO();
        return pDAO.listar();
    }

    public Pedido carregaPorId(int pedido_id) throws Exception {
        PedidoDAO pDAO = new PedidoDAO();
        this.id = pDAO.carregaPorId(pedido_id).getId();
        this.dataPedido = pDAO.carregaPorId(pedido_id).getDataPedido();
        this.obs = pDAO.carregaPorId(pedido_id).getObs();
        this.status = pDAO.carregaPorId(pedido_id).getStatus();
        this.tipoPagamento = pDAO.carregaPorId(pedido_id).getTipoPagamento();
        this.precoFinal = pDAO.carregaPorId(pedido_id).getPrecoFinal();
        this.cliente = pDAO.carregaPorId(pedido_id).getCliente();
        this.usuario = pDAO.carregaPorId(pedido_id).getUsuario();
        return this;
    }  
    public ArrayList<Pedido> carregaPorCliente(int cliente_id) throws Exception {
        PedidoDAO pDAO = new PedidoDAO();
        this.id = pDAO.carregaPorId(cliente_id).getId();
        this.dataPedido = pDAO.carregaPorId(cliente_id).getDataPedido();
        this.obs = pDAO.carregaPorId(cliente_id).getObs();
        this.status = pDAO.carregaPorId(cliente_id).getStatus();
        this.tipoPagamento = pDAO.carregaPorId(cliente_id).getTipoPagamento();
        this.precoFinal = pDAO.carregaPorId(cliente_id).getPrecoFinal();
        this.cliente = pDAO.carregaPorId(cliente_id).getCliente();
        this.usuario = pDAO.carregaPorId(cliente_id).getUsuario();
        return pDAO.listar();
    } 
    public void alteraStatus() throws Exception{
        PedidoDAO pDAO = new PedidoDAO();
	pDAO.alteraStatus(this);
    }
}
