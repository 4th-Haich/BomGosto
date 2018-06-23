package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Perfil;
import model.Usuario;

public class GerenciarMenuPerfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarMenuPerfil</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                Usuario uLogado = new Usuario();
                HttpSession session = request.getSession();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
                    int id_menu = Integer.parseInt(request.getParameter("id_menu"));
                    int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
                    String op = request.getParameter("op");
                    Perfil p = new Perfil();
                    if (op.equals("vincular")) {
                        switch (uLogado.getPerfil().getId()) {
                            case 1: {
                                p.vincularMenu(id_perfil, id_menu);
                            }
                            break;
                            default: {
                                out.print("<script> alert ('Acesso Negado'); </script>");
                                out.print("<script> location.href = ('login.jsp'); </script>");
                            }
                            break;
                        }
                    } else {
                        switch (uLogado.getPerfil().getId()) {
                            case 1: {
                                p.desvincularMenu(id_perfil, id_menu);
                            }
                            break;
                            default: {
                                out.print("<script> alert ('Acesso Negado'); </script>");
                                out.print("<script> location.href = ('login.jsp'); </script>");
                            }
                            break;
                        }
                    }
                    response.sendRedirect("form_gerenciar_menu_perfil.jsp?id=" + id_perfil);
                } catch (Exception e) {
                    out.print("Erro:" + e);
                    response.sendRedirect("login.jsp");
                }
            } catch (Exception e) {
                out.print("Erro:" + e);
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
