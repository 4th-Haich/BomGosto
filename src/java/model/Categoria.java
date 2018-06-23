package model;

import java.util.ArrayList;

public class Categoria {
     private int id;
     private String nome;

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
    
    public void inserir() throws Exception{
        CategoriaDAO cDAO = new CategoriaDAO();
        cDAO.inserir(this);
    }
    public void alterar() throws Exception{
        CategoriaDAO cDAO = new CategoriaDAO();
        cDAO.alterar(this);
    }
    /*public void excluir() throws Exception{
        CategoriaDAO cDAO = new CategoriaDAO();
        cDAO.excluir(this);
    }*/
    public ArrayList<Categoria> listar() throws Exception{
        CategoriaDAO cDAO = new CategoriaDAO();
        return cDAO.listar();
    }
    public Categoria carregaPorId(int categoria_id) throws Exception{
        CategoriaDAO cDAO = new CategoriaDAO();
        this.id = cDAO.carregaPorId(categoria_id).getId();
        this.nome = cDAO.carregaPorId(categoria_id).getNome();
        return this;
    }
}
