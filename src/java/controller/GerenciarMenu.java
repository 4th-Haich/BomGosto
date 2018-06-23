package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Menu;
import model.Usuario;

public class GerenciarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarMenu</title>");
            out.println("</head>");
            out.println("<body>");
            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String titulo = request.getParameter("titulo");
            String link = request.getParameter("link");
            String icone = request.getParameter("icone");
            try {

                Usuario uLogado = new Usuario();
                HttpSession session = request.getSession();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");

                    Menu m = new Menu();
                    m.setTitulo(titulo);
                    m.setLink(link);
                    m.setIcone(icone);
                    switch (op) {
                        case "inserir": {
                            if (titulo.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (link.isEmpty()) {
                                out.print("O campo Link deve ser preenchido!");
                            } else if (icone.isEmpty()) {
                                out.print("O campo Ícone deve ser preenchido!");
                            } else {
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        m.inserir();
                                        out.print("<script> alert ('Menu Cadastrado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_menu.jsp');</script>");
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
                        case "alterar": {
                            if (titulo.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (link.isEmpty()) {
                                out.print("O campo Link deve ser preenchido!");
                            } else if (icone.isEmpty()) {
                                out.print("O campo Ícone deve ser preenchido!");
                            } else {
                                m.setId(Integer.parseInt(id));
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        m.alterar();
                                        out.print("<script> alert ('Menu Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_menu.jsp');</script>");
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
                            m.setId(Integer.parseInt(id));
                            switch (uLogado.getPerfil().getId()) {
                                case 1: {
                                    m.excluir();
                                }
                                break;
                                default: {
                                    out.print("<script> alert ('Acesso Negado'); </script>"); 
                                    out.print("<script> location.href = ('login.jsp'); </script>");
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
                //response.sendRedirect("listar_menu.jsp");
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
