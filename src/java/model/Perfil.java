package model;

import java.util.ArrayList;

public class Perfil {

    private int id;
    private String nome;
    private String descricao;
    private ArrayList<Menu> listaMenu;

    public enum PerfilN {
        Administrador, 
        Gerente,
        Funcionario,
        Cliente;
    }

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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public ArrayList<Menu> getListaMenu() {
        return listaMenu;
    }

    public void setListaMenu(ArrayList<Menu> listaMenu) {
        this.listaMenu = listaMenu;
    }

    public void inserir() throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.inserir(this);
    }

    public void alterar() throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.alterar(this);
    }

    /*public void excluir() throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.excluir(this);
    }*/

    public ArrayList<Perfil> listar() throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        return pDAO.listar();
    }

    public Perfil carregaPorId(int id_perfil) throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        this.id = pDAO.carregaPorId(id_perfil).getId();
        this.nome = pDAO.carregaPorId(id_perfil).getNome();
        this.descricao = pDAO.carregaPorId(id_perfil).getDescricao();
        this.listaMenu = pDAO.carregaMenusPerfil(id_perfil);
        return this;
    }
    
    public ArrayList<Menu> carregaMenusPerfil(int id_perfil) throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        return pDAO.carregaMenusPerfil(id_perfil);
    }
    
    public ArrayList<Menu> carregaMenusNaoPerfil(int id_perfil) throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        return pDAO.carregaMenusNaoPerfil(id_perfil);
    }

    public void vincularMenu(int id_perfil, int id_menu) throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.vincularMenu(id_perfil, id_menu);
    }

    public void desvincularMenu(int id_perfil, int id_menu) throws Exception {
        PerfilDAO pDAO = new PerfilDAO();
        pDAO.desvincularMenu(id_perfil, id_menu);
    }
}
