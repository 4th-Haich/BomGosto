package model;

import java.util.ArrayList;

public class Usuario {
    private int id;
    private String nome;
    private String telefone;
    private String cpf;
    private String senha;
    private Perfil perfil;

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
   
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public void inserir() throws Exception{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.inserir(this);
    }
    public void alterar() throws Exception{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.alterar(this);
    }
    /*public void excluir() throws Exception{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.excluir(this);
    }*/
    public ArrayList<Usuario> listar() throws Exception{
        UsuarioDAO uDAO = new UsuarioDAO();
        return uDAO.listar();
    }
    public Usuario carregaPorId(int usuario_id) throws Exception{
        UsuarioDAO uDAO = new UsuarioDAO();
        this.id = uDAO.carregaPorId(usuario_id).getId();
        this.nome = uDAO.carregaPorId(usuario_id).getNome();
        this.telefone = uDAO.carregaPorId(usuario_id).getTelefone();        
        this.cpf = uDAO.carregaPorId(usuario_id).getCpf();
        this.senha = uDAO.carregaPorId(usuario_id).getSenha();
        this.perfil = uDAO.carregaPorId(usuario_id).getPerfil();
        return this;
    }
    
    public void logar(String cpf, String senha) throws Exception{
        UsuarioDAO uDAO = new UsuarioDAO();
        uDAO.logar(cpf, senha);
    }
    public static boolean verificar(String cpf) throws Exception{
       UsuarioDAO uDAO = new UsuarioDAO();
        return uDAO.verificar(cpf);
    }
}
   
