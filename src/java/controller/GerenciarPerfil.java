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

public class GerenciarPerfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarPerfil</title>");
            out.println("</head>");
            out.println("<body>");

            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");

            try {

                Usuario uLogado = new Usuario();
                HttpSession session = request.getSession();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");

                    Perfil p = new Perfil();
                    p.setNome(nome);
                    p.setDescricao(descricao);

                    switch (op) {
                        case "inserir": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (descricao.isEmpty()) {
                                out.print("O campo Descrição deve ser preenchido!");
                            } else {
                                p.setId(Integer.parseInt(id));
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        p.inserir();
                                        out.print("<script> alert ('Perfil Cadastrado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_perfil.jsp');</script>");
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
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (descricao.isEmpty()) {
                                out.print("O campo Descrição deve ser preenchido!");
                            } else {
                                p.setId(Integer.parseInt(id));
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        p.alterar();
                                        out.print("<script> alert ('Perfil Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_perfil.jsp');</script>");
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
                            p.setId(Integer.parseInt(id));
                            switch (uLogado.getPerfil().getId()) {
                                case 1: {
                                    p.excluir();
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
                //response.sendRedirect("listar_perfil.jsp");
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
