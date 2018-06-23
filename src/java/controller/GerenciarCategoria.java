package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Categoria;
import model.CategoriaDAO;
import model.Usuario;

@WebServlet(name = "GerenciarCategoria", urlPatterns = {"/gerenciar_categoria.do"})
public class GerenciarCategoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCategoria</title>");
            out.println("</head>");
            out.println("<body>");

            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");

            try {
                Usuario uLogado = new Usuario();
                HttpSession session = request.getSession();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
                    Categoria c = new Categoria();
                    c.setNome(nome);
                    switch (op) {
                        case "inserir": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else {
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        c.inserir();
                                        out.print("<script> alert ('Categoria Cadastrada com Sucesso'); </script>");
                                        out.print("<script> location.href = ('listar_categoria.jsp'); </script>");
                                    }
                                    break;
                                    case 2: {
                                        c.inserir();
                                        out.print("<script> alert ('Categoria Cadastrada com Sucesso'); </script>");
                                        out.print("<script> location.href = ('listar_categoria.jsp'); </script>");
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ('listar_categoria.jsp'); </script>");
                                    }
                                    break;
                                }
                            }
                        }
                        break;
                        case "alterar": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else {
                                c.setId(Integer.parseInt(id));

                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        c.alterar();
                                        out.print("<script> alert ('Categoria Alterada com Sucesso'); </script>");
                                        out.print("<script> location.href = ('listar_categoria.jsp'); </script>");
                                    }
                                    break;
                                    case 2: {
                                        c.alterar();
                                        out.print("<script> alert ('Categoria Alterada com Sucesso'); </script>");
                                        out.print("<script> location.href = ('listar_categoria.jsp'); </script>");
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ('login.jsp'); </script>");
                                    }
                                    break;
                                }
                            }
                        }
                        break;
                        /*case "excluir": {
                            c.setId(Integer.parseInt(id));
                            switch (uLogado.getPerfil().getId()) {
                                case 1: {
                                    c.excluir();
                                }
                                break;
                                default: {
                                    out.print("<script> alert ('Acesso Negado'); </script>");
                                }
                                break;
                            }

                        }
                        break;*/
                    }
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
