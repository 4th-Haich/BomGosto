package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.ClienteDAO;
import model.Usuario;
import model.UsuarioDAO;

public class ValidaLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ValidaLogin</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
                if (login.isEmpty()) {
                    out.print("O campo Usuário deve ser preenchido!");
                } else if (senha.isEmpty()) {
                    out.print("O campo Senha deve ser preenchido!");
                } else {
                    Cliente c = new Cliente();
                    Usuario u = new Usuario();
                    UsuarioDAO uDAO = new UsuarioDAO();
                    u = uDAO.logar(login, senha);
                    ClienteDAO cDAO = new ClienteDAO();
                    c = cDAO.logar(login, senha);

                    if (u.getId() != 0) {
                        switch (u.getPerfil().getId()) {
                            case 1: {
                                session.setAttribute("usuario", u);
                                ArrayList carrinho = new ArrayList();
                                double totalcost = 0.0;
                                session.setAttribute("carrinho", carrinho);
                                session.setAttribute("total", totalcost);
                                response.sendRedirect("area_admin.jsp");
                            }
                            break;
                            case 2: {
                                session.setAttribute("usuario", u);
                                ArrayList carrinho = new ArrayList();
                                double totalcost = 0.0;
                                session.setAttribute("carrinho", carrinho);
                                session.setAttribute("total", totalcost);
                                response.sendRedirect("area_admin.jsp");
                            }
                            break;
                            case 3: {
                                session.setAttribute("usuario", u);
                                ArrayList carrinho = new ArrayList();
                                double totalcost = 0.0;
                                session.setAttribute("carrinho", carrinho);
                                session.setAttribute("total", totalcost);
                                response.sendRedirect("listar_pedido.jsp");
                            }
                            break;
                            default: {
                                out.print("Usuário ou senha inválidos");
                                out.print("<script> location.href = ('login.jsp');</script>");
                                //response.sendRedirect("login.jsp");
                            }
                            break;
                        }
                    } else if (c.getId() != 0) {
                        session.setAttribute("usuario", c);
                        ArrayList carrinho = new ArrayList();
                        double totalcost = 0.0;
                        session.setAttribute("carrinho", carrinho);
                        session.setAttribute("total", totalcost);
                        response.sendRedirect("index.jsp");
                    } else {

                        out.print("<script> alert ('Usuário ou senha inválidos');</script>");
                        out.print("<script> location.href = ('login.jsp');</script>");

                    }
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
