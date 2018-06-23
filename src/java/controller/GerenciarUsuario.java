package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Perfil;
import model.Usuario;

public class GerenciarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarUsuario</title>");
            out.println("</head>");
            out.println("<body>");

            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String nome = request.getParameter("nome");
            String telefone = request.getParameter("telefone");
            String cpf = request.getParameter("login");
            String senha = request.getParameter("senha");
            String perfil_id = request.getParameter("perfil_id");

            try {

                Usuario uLogado, u = new Usuario();

                HttpSession session = request.getSession();

                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
                    u.setNome(nome);
                    u.setTelefone(telefone);
                    u.setCpf(cpf);
                    u.setSenha(senha);
                    Perfil p = new Perfil();
                    switch (op) {
                        case "inserir": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (telefone.isEmpty()) {
                                out.print("O campo Telefone deve ser preenchido!");
                            } else if (cpf.isEmpty()) {
                                out.print("O campo Cpf deve ser preenchido!");
                            } else if (senha.isEmpty()) {
                                out.print("O campo Senha deve ser preenchido!");
                            } else if (perfil_id.isEmpty()) {
                                out.print("O campo Perfil deve ser selecionado!");
                            } else {
                                p.setId(Integer.parseInt(perfil_id));
                                u.setPerfil(p);
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        if (Cliente.verificar(cpf) == false && Usuario.verificar(cpf) == false) {
                                            u.inserir();
                                            out.print("<script> alert ('Usuário Cadastrado com Sucesso'); </script>");
                                            out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");                                            
                                        } else {
                                            out.print("<script> alert ('Login Inválido'); </script>");
                                            out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");
                                        }
                                    }
                                    break;
                                    case 2: {
                                        if (Cliente.verificar(cpf) == false && Usuario.verificar(cpf) == false) {
                                            if (u.getPerfil().getId() < uLogado.getPerfil().getId()) {
                                                out.print("<script> alert ('Acesso Negado'); </script>");
                                            } else {
                                                u.inserir();
                                                out.print("<script> alert ('Usuário Cadastrado com Sucesso'); </script>");
                                                out.print("<script> location.href = ('listar_usuario.jsp'); </script>");
                                            }
                                        } else {
                                            out.print("<script> alert ('Login Inválido'); </script>");
                                            out.print("<script> location.href = ('listar_usuario.jsp'); </script>");
                                        }
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");
                                    }
                                    break;
                                }
                            }
                        }
                        break;
                        case "alterar": {
                            if (nome.isEmpty()) {
                                out.print("O campo Nome deve ser preenchido!");
                            } else if (telefone.isEmpty()) {
                                out.print("O campo Telefone deve ser preenchido!");
                            } else if (cpf.isEmpty()) {
                                out.print("O campo Cpf deve ser preenchido!");
                            } else if (senha.isEmpty()) {
                                out.print("O campo Senha deve ser preenchido!");
                            } else if (perfil_id.isEmpty()) {
                                out.print("O campo Perfil deve ser selecionado!");
                            } else {
                                p.setId(Integer.parseInt(perfil_id));
                                u.setId(Integer.parseInt(id));
                                u.setPerfil(p);
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        u.alterar();
                                        out.print("<script> alert ('Usuário Alterado com Sucesso'); </script>");
                                        out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");
                                    }
                                    break;
                                    case 2: {
                                        if (u.getPerfil().getId() < uLogado.getPerfil().getId()) {
                                            out.print("<script> alert ('Acesso Negado'); </script>");
                                            out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");
                                        } else {
                                            u.alterar();
                                            out.print("<script> alert ('Usuário Alterado com Sucesso'); </script>");
                                            out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");
                                        }
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ( 'listar_usuario.jsp'); </script>");
                                    }
                                    break;
                                }

                            }
                        }
                        break;
                        /*case "excluir": {
                            u.setId(Integer.parseInt(id));
                            switch (uLogado.getPerfil().getId()) {
                                case 1: {
                                    u.excluir();
                                }
                                break;
                                default: {
                                    out.print("<script> alert ('Acesso Negado') </script>");
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
                //response.sendRedirect("listar_usuario.jsp");
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
