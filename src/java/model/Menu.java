package model;

import java.util.ArrayList;

public class Menu {
    private int id;
    private String titulo;
    private String link;
    private String icone;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }
    
    public void inserir() throws Exception{
        MenuDAO mDAO = new MenuDAO();
        mDAO.inserir(this);
    }
    public void alterar() throws Exception{
        MenuDAO mDAO = new MenuDAO();
        mDAO.alterar(this);
    }
    /*public void excluir() throws Exception{
        MenuDAO mDAO = new MenuDAO();
        mDAO.excluir(this);
    }*/
    public ArrayList<Menu> listar() throws Exception{
        MenuDAO mDAO = new MenuDAO();
        return mDAO.listar();
    }
    public Menu carregaPorId(int menu_id) throws Exception{
        MenuDAO mDAO = new MenuDAO();
        this.id = mDAO.carregaPorId(menu_id).getId();
        this.titulo = mDAO.carregaPorId(menu_id).getTitulo();
        this.link = mDAO.carregaPorId(menu_id).getLink();
        this.icone = mDAO.carregaPorId(menu_id).getIcone();
        return this;
    }
}
