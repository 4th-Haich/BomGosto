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
import model.Produto;
import model.ProdutoDAO;
import model.Usuario;

@WebServlet(name = "GerenciarProduto", urlPatterns = {"/gerenciar_produto.do"})
public class GerenciarProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarProduto</title>");
            out.println("</head>");
            out.println("<body>");

            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String unidadeMedida = request.getParameter("unidadeMedida");
            String precoUnitario = request.getParameter("precoUnitario");
            String categoria_id = request.getParameter("categoria_id");
            String imagem = request.getParameter("imagem");

            try {
                Usuario uLogado = new Usuario();
                HttpSession session = request.getSession();
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");

                    Produto p = new Produto();
                    p.setNome(nome);
                    p.setImagem(imagem);                    
                    Categoria c = new Categoria();

                    ProdutoDAO pDAO = new ProdutoDAO();
                    switch (op) {
                        case "inserir": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (precoUnitario.isEmpty()) {
                                out.print("O campo Endereço deve ser preenchido!");
                            } else if (categoria_id.isEmpty()) {
                                out.print("O campo Número da Cada deve ser preenchido!");
                            }
                            c.setId(Integer.parseInt(categoria_id));
                            p.setPrecoUnitario(Double.parseDouble(precoUnitario));
                            p.setCategoria(c);

                            switch (uLogado.getPerfil().getId()) {
                                case 1: {
                                    p.inserir();
                                    out.print("<script> alert ('Produto Cadastrado com Sucesso');</script>");
                                    out.print("<script> location.href = ('listar_produto.jsp');</script>");
                                }
                                break;
                                case 2: {
                                    p.inserir();
                                    out.print("<script> alert ('Produto Cadastrado com Sucesso');</script>");
                                    out.print("<script> location.href = ('listar_produto.jsp');</script>");
                                }
                                break;
                                default: {
                                    out.print("<script> alert ('Acesso Negado'); </script>");
                                    out.print("<script> location.href = ('login.jsp');</script>");
                                }
                                break;
                            }
                        }
                        break;
                        case "alterar": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (precoUnitario.isEmpty()) {
                                out.print("O campo Endereço deve ser preenchido!");
                            } else if (categoria_id.isEmpty()) {
                                out.print("O campo Categoria deve ser preenchido!");
                            } else {
                                c.setId(Integer.parseInt(categoria_id));
                                p.setPrecoUnitario(Double.parseDouble(precoUnitario));
                                p.setCategoria(c);
                                p.setId(Integer.parseInt(id));
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        p.alterar();
                                        out.print("<script> alert ('Produto Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_produto.jsp');</script>");
                                    }
                                    break;
                                    case 2: {
                                        p.alterar();
                                        out.print("<script> alert ('Produto Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_produto.jsp');</script>");
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ('login.jsp');</script>");
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
                                }
                                break;
                            }

                        }
                        break;*/
                    }
                } catch (Exception e) {
                    out.print("<script> alert ('Ocorreu um erro: " + e + "'); </script>");
                    out.print("<script> location.href = ('login.jsp');</script>");
                }
                //response.sendRedirect("listar_produto.jsp");
            } catch (Exception e) {
                out.print("<script> alert ('Ocorreu um erro: " + e + "'); </script>");
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
