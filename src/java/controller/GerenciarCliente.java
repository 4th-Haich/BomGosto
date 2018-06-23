package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Usuario;

@WebServlet(name = "GerenciarCliente", urlPatterns = {"/gerenciar_cliente.do"})
public class GerenciarCliente extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCliente</title>");
            out.println("</head>");
            out.println("<body>");

            String recipient = request.getParameter("recipient");
            String subject = request.getParameter("subject");
            String content = request.getParameter("content");

            String resultMessage = "";

            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String telefone = request.getParameter("telefone");
            String cep = request.getParameter("cep");
            String cidade = request.getParameter("cidade");
            String endereco = request.getParameter("endereco");
            String numCasa = request.getParameter("numcasa");
            String complemento = request.getParameter("complemento");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            try {
                Cliente c = new Cliente();
                c.setNome(nome);
                c.setTelefone(telefone);
                c.setCep(cep);
                c.setCidade(cidade);
                c.setEndereco(endereco);
                c.setNumCasa(numCasa);
                c.setComplemento(complemento);
                c.setLogin(login);
                c.setSenha(senha);
                Usuario uLogado = new Usuario();
                Cliente uLogadoC = new Cliente();
                HttpSession session = request.getSession();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
                } catch (Exception e) {
                }
                try {
                    uLogadoC = (Cliente) session.getAttribute("usuario");
                } catch (Exception e) {
                }
                try {
                    switch (op) {
                        case "inserir": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (telefone.isEmpty()) {
                                out.print("O campo Telefone deve ser preenchido!");
                            } else if (cep.isEmpty()) {
                                out.print("O campo Cep deve ser preenchido!");
                            } else if (cidade.isEmpty()) {
                                out.print("O campo Cidade deve ser preenchido!");
                            } else if (endereco.isEmpty()) {
                                out.print("O campo Endereço deve ser preenchido!");
                            } else if (numCasa.isEmpty()) {
                                out.print("O campo Número da Casa deve ser preenchido!");
                            } else if (login.isEmpty()) {
                                out.print("O campo Login deve ser preenchido!");
                            } else if (senha.isEmpty()) {
                                out.print("O campo Senha deve ser preenchido!");
                            } else {
                                if (Cliente.verificar(login) == false && Usuario.verificar(login) == false) {
                                    c.inserir();
                                   /* if (uLogado.getId() != 0) {*/
                                        out.print("<script> alert ('Cliente Cadastrado com Sucesso'); </script>");
                                        out.print("<script> location.href = ('login.jsp'); </script>");
                                        //response.sendRedirect("listar_cliente.jsp");
                                    /*} else {
                                        out.print("<script> alert ('Cliente Cadastrado com Sucesso'); </script>");
                                        out.print("<script> location.href ('login.jsp'); </script>");
                                        //out.print("<script> location.href = ('login.jsp');</script>");
                                   // }*/
                                } else {
                                    out.print("<script> alert ('Login Inválido'); </script>");
                                    if (uLogado.getId() != 0) {                                       
                                        out.print("<script> location.href ('listar_cliente.jsp'); </script>");
                                        //response.sendRedirect("listar_cliente.jsp");
                                    } else {                                        
                                        out.print("<script> location.href ('registro.jsp'); </script>");
                                        //out.print("<script> location.href = ('login.jsp');</script>");
                                    }
                                }
                            }
                        }
                        break;
                        case "alterar": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (telefone.isEmpty()) {
                                out.print("O campo Telefone deve ser preenchido!");
                            } else if (cep.isEmpty()) {
                                out.print("O campo Cep deve ser preenchido!");
                            } else if (cidade.isEmpty()) {
                                out.print("O campo Cidade deve ser preenchido!");
                            } else if (endereco.isEmpty()) {
                                out.print("O campo Endereço deve ser preenchido!");
                            } else if (numCasa.isEmpty()) {
                                out.print("O campo Número da Cada deve ser preenchido!");
                            } else if (login.isEmpty()) {
                                out.print("O campo Login deve ser preenchido!");
                            } else if (senha.isEmpty()) {
                                out.print("O campo Senha deve ser preenchido!");
                            } else {
                                c.setId(Integer.parseInt(id));                                
                                if (uLogado.getId() != 0) {
                                    c.alterar();
                                    out.print("<script> alert ('Cliente Alterado com Sucesso'); </script>");
                                    out.print("<script> location.href = ('listar_cliente.jsp'); </script>");
                                    //response.sendRedirect("listar_cliente.jsp");
                                } else if (uLogadoC.getId() == c.getId()) {
                                    c.alterar();
                                    out.print("<script> alert ('Cliente Alterado com Sucesso'); </script>");
                                    out.print("<script> location.href = ('index.jsp'); </script>");
                                    //response.sendRedirect("index.jsp");
                                } else {
                                    out.print("<script> alert ('Acesso Negado'); </script>");
                                    out.print("<script> location.href = ('index.jsp'); </script>");
                                    //response.sendRedirect("index.jsp");
                                }                                
                            }
                        }
                        break;
                        /*case "excluir": {
                            c.setId(Integer.parseInt(id));
                            if (uLogado.getPerfil().getId() == 1) {
                                c.excluir();
                                out.print("<script> alert ('Excuido com Sucesso') </script>");
                                out.print("<script> location.href ('listar_cliente.jsp') </script>");
                            } else {
                                out.print("<script> alert ('Acesso Negado') </script>");
                            }
                        }
                        break;*/
                    }
                    //response.sendRedirect("listar_cliente.jsp");
                } catch (Exception e) {
                    out.print("<script> alert ('Ocorreu um erro: "+e+"'); </script>");
                    out.print("<script> location.href = ('login.jsp');</script>");
                }

            } catch (Exception e) {
                out.print("<script> alert ('Ocorreu um erro: "+e+"'); </script>");
                out.print("<script> location.href = ('login.jsp');</script>");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
