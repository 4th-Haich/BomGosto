package model;

import java.util.ArrayList;

public class Produto {
    private int id;
    private String nome;
    private String tamanho;
    private int qtd;
    
    private double precoUnitario;
    private String imagem;
    private Categoria categoria;
	
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public double getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
    public void inserir() throws Exception{
        ProdutoDAO pDAO = new ProdutoDAO();
        pDAO.inserir(this);
    }
    public void inserirProduto(Carrinho ca,int id) throws Exception{
        PedidoDAO pDAO = new PedidoDAO();
        pDAO.inserirProduto(ca, id);
    }
    public void alterar() throws Exception{
        ProdutoDAO pDAO = new ProdutoDAO();
        pDAO.alterar(this);
    }
    /*public void excluir() throws Exception{
        ProdutoDAO pDAO = new ProdutoDAO();
        pDAO.excluir(this);
    }*/
    public ArrayList<Produto> listar() throws Exception{
        ProdutoDAO pDAO = new ProdutoDAO();
        return pDAO.listar();
    }
    public Produto carregaPorId(int produto_id) throws Exception{
        ProdutoDAO pDAO = new ProdutoDAO();
        this.id = pDAO.carregaPorId(produto_id).getId();
        this.nome = pDAO.carregaPorId(produto_id).getNome();               
        this.precoUnitario = pDAO.carregaPorId(produto_id).getPrecoUnitario();
        this.imagem = pDAO.carregaPorId(produto_id).getImagem();
        this.categoria = pDAO.carregaPorId(produto_id).getCategoria();
        return this;
    }
    public ArrayList<Produto> carregaPedidoProduto(int id_pedido) throws Exception{
        ProdutoDAO pDAO = new ProdutoDAO();
        return pDAO.carregaPedidoProduto(id_pedido);
    }

}
