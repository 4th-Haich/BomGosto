package model;

import java.util.ArrayList;
import java.util.Random;

public class Cliente {
    private int id;
    private String nome;
    private String telefone;
    private String cep;
    private String cidade;
    private String endereco;
    private String numCasa;
    private String complemento;
    private String login;
    private String senha;

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

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNumCasa() {
        return numCasa;
    }

    public void setNumCasa(String numCasa) {
        this.numCasa = numCasa;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }      

    public void inserir() throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        cDAO.inserir(this);
    }
    public void alterar() throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        cDAO.alterar(this);
    }
    /*public void excluir() throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        cDAO.excluir(this);
    }*/
    public ArrayList<Cliente> listar() throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        return cDAO.listar();
    }
    public Cliente carregaPorId(int cliente_id) throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        this.id = cDAO.carregaPorId(cliente_id).getId();
        this.nome = cDAO.carregaPorId(cliente_id).getNome();
        this.telefone = cDAO.carregaPorId(cliente_id).getTelefone();
        this.cep = cDAO.carregaPorId(cliente_id).getCep();
        this.cidade = cDAO.carregaPorId(cliente_id).getCidade();
        this.endereco = cDAO.carregaPorId(cliente_id).getEndereco();
        this.numCasa = cDAO.carregaPorId(cliente_id).getNumCasa();
        this.complemento = cDAO.carregaPorId(cliente_id).getComplemento();
        this.login = cDAO.carregaPorId(cliente_id).getLogin();
        this.senha = cDAO.carregaPorId(cliente_id).getSenha();
        return this;
    }
    
    public void logar(String login, String senha) throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        cDAO.logar(login, senha);
    }
    
    public void alterarSenha(String login, String senha) throws Exception{
        ClienteDAO cDAO = new ClienteDAO();
        cDAO.alterarSenha(login, senha);
    }
    
    public static boolean verificar(String login) throws Exception{
        ClienteDAO cDAO = new ClienteDAO();        
        return cDAO.verificar(login);
    }
     public static String gerarSenha() {
        String CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 8) { 
            int index = (int) (rnd.nextFloat() * CHARS.length());
            salt.append(CHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
}
