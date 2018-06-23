/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import model.Cliente;
import model.ClienteDAO;


public class EmailSendingServlet extends HttpServlet {

    private String host;
    private String porta;
    private String emailUsuario;
    private String senhaUsuario;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        porta = context.getInitParameter("porta");
        emailUsuario = context.getInitParameter("emailUsuario");
        senhaUsuario = context.getInitParameter("senhaUsuario");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmailSendingServlet</title>");
            out.println("</head>");
            out.println("<body>");

            Cliente c = new Cliente();
            String senha = c.gerarSenha();
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String assunto = "Recuperação de Conta. BomGosto";
            String conteudo = ("E-mail enviado do site BomGosto. A senha provisória é:" + senha);
            String resultMessage = "";
            out.print("<h2>");            

            try {
                if (Cliente.verificar(email) == true) {
                    ArrayList<Cliente> lista = new ArrayList<Cliente>();
                    try {
                        ClienteDAO cDAO = new ClienteDAO();
                        lista = cDAO.listar();
                    } catch (Exception e) {
                        out.print("Erro: " + e);
                    }
                    for (Cliente cl : lista) {
                        if (cl.getLogin().equals(email) && cl.getTelefone().equals(telefone)) {                            
                            
                            EmailUtility.sendEmail(host, porta, emailUsuario, senhaUsuario, email, assunto, conteudo);
                            c.alterarSenha(email, senha);
                            resultMessage = "A nova senha foi enviada ao seu e-mail";
                        } else {
                            out.println("<h1>Falha no envio</h1>");
                        }
                    }
                    
                }

            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "Ocorreu um erro: " + ex.getMessage();
            } finally {
                request.setAttribute("mensagem", resultMessage);
                getServletContext().getRequestDispatcher("/resultado.jsp").forward(request, response);
            }
            out.print("</h2>");
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
