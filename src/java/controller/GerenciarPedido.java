package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Pedido;
import model.Produto;
import model.Usuario;
import model.Carrinho;

@WebServlet(name = "GerenciarPedido", urlPatterns = {"/gerenciar_pedido.do"})
public class GerenciarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarPedido</title>");
            out.println("</head>");
            out.println("<body>");

            HttpSession session = request.getSession();

            String op = request.getParameter("op");
            String id = request.getParameter("id");
            String dataPedido = request.getParameter("data_pedido");
            String obs = request.getParameter("obs");
            String src = request.getParameter("src");
            String tamanho = request.getParameter("tamanho");
            String status = request.getParameter("status");
            String tipoPagamento = request.getParameter("tipo_pagamento");
            String precoFinal = request.getParameter("preco_final");
            String cliente_id = request.getParameter("cliente_id");
            String usuario_id = request.getParameter("usuario_id");
            double value = (double) session.getAttribute("total");

            ArrayList carrinho = (ArrayList) session.getAttribute("carrinho");

            Pedido p = new Pedido();
            p.setDataPedido(dataPedido);
            p.setObs(obs);
            p.setStatus(status);
            p.setTipoPagamento(tipoPagamento);
            Usuario uLogado = new Usuario();
            Cliente uLogadoC = new Cliente();
            Cliente c = new Cliente();
            Usuario u = new Usuario();
            try {
                switch (op) {
                    case "inserir": {
                        try {
                            uLogado = (Usuario) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        try {
                            uLogadoC = (Cliente) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        if (dataPedido.isEmpty()) {
                            out.print("O campo Data do Pedido deve ser preenchido!");
                        } else if (status.isEmpty()) {
                            out.print("O campo Status deve ser preenchido!");
                        } else if (tipoPagamento.isEmpty()) {
                            out.print("O campo Tipo de Pagamento deve ser preenchido!");
                        } else if (precoFinal.isEmpty()) {
                            out.print("O campo Preço Final deve ser preenchido!");
                        } else if (cliente_id.isEmpty()) {
                            out.print("O campo Cliente deve ser selecionado!");
                        } else {
                            p.setPrecoFinal(Double.parseDouble(precoFinal));
                            c.setId(Integer.parseInt(cliente_id));
                            out.print(c.getId());
                            p.setCliente(c);
                            u.setId(Integer.parseInt(usuario_id));
                            p.setUsuario(u);

                            if (uLogado.getId() != 0) {
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        p.inserir(carrinho);
                                        out.print("<script> alert ('Pedido Cadastrado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_pedido.jsp');</script>");
                                    }
                                    break;
                                    case 2: {
                                        p.inserir(carrinho);
                                        out.print("<script> alert ('Pedido Cadastrado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_pedido.jsp');</script>");
                                    }
                                    break;
                                    case 3: {
                                        p.inserir(carrinho);
                                        out.print("<script> alert ('Pedido Cadastrado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_pedido.jsp');</script>");
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ('login.jsp'); </script>");
                                    }
                                    break;
                                }
                                session.removeAttribute("carrinho");
                                ArrayList carrinhoL = new ArrayList();
                                session.setAttribute("carrinho", carrinhoL);
                                session.removeAttribute("total");
                                double total = 0.0;
                                session.setAttribute("total", total);
                                session.removeAttribute("cliente");
                                int cliente = 0;
                                session.setAttribute("cliente", cliente);
                                response.sendRedirect("listar_pedido.jsp");
                            } else if (uLogadoC.getId() != 0) {
                                p.inserir(carrinho);
                                session.removeAttribute("carrinho");
                                ArrayList carrinhoL = new ArrayList();
                                session.setAttribute("carrinho", carrinhoL);
                                session.removeAttribute("total");
                                double total = 0.0;
                                session.setAttribute("total", total);
                                response.sendRedirect("pedidos.jsp");
                            } else {
                                out.print("<script> alert ('Acesso Negado'); </script>");
                                out.print("<script> location.href = ('login.jsp'); </script>");
                            }
                        }
                    }
                    break;
                    case "alterar": {
                        try {
                            uLogado = (Usuario) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        try {
                            uLogadoC = (Cliente) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        if (dataPedido.isEmpty()) {
                            out.print("O campo Data do Pedido deve ser preenchido!");
                        } else if (obs.isEmpty()) {
                            out.print("O campo Observações deve ser preenchido!");
                        } else if (status.isEmpty()) {
                            out.print("O campo Status deve ser preenchido!");
                        } else if (tipoPagamento.isEmpty()) {
                            out.print("O campo Tipo de Pagamento deve ser preenchido!");
                        } else if (precoFinal.isEmpty()) {
                            out.print("O campo Preço Final deve ser preenchido!");
                        } else if (cliente_id.isEmpty()) {
                            out.print("O campo Cliente deve ser selecionado!");
                        } else if (usuario_id.isEmpty()) {
                            out.print("O campo usuario deve ser selecionado!");
                        } else {
                            p.setPrecoFinal(Double.parseDouble(precoFinal));
                            c.setId(Integer.parseInt(cliente_id));
                            p.setCliente(c);
                            u.setId(Integer.parseInt(usuario_id));
                            p.setUsuario(u);
                            p.setId(Integer.parseInt(id));
                            if (uLogado.getId() != 0) {
                                switch (uLogado.getPerfil().getId()) {
                                    case 1: {
                                        p.alterar();
                                        out.print("<script> alert ('Pedido Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_pedido.jsp');</script>");
                                    }
                                    break;
                                    case 2: {
                                        p.alterar();
                                        out.print("<script> alert ('Pedido Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_pedido.jsp');</script>");
                                    }
                                    break;
                                    case 3: {
                                        p.alterar();
                                        out.print("<script> alert ('Pedido Alterado com Sucesso');</script>");
                                        out.print("<script> location.href = ('listar_pedido.jsp');</script>");
                                    }
                                    break;
                                    default: {
                                        out.print("<script> alert ('Acesso Negado'); </script>");
                                        out.print("<script> location.href = ('login.jsp'); </script>");
                                    }
                                    break;
                                }
                            } else if (uLogadoC.getId() != 0) {
                                if (p.getCliente().getId() == uLogadoC.getId()) {
                                    p.alterar();
                                }
                            } else {
                                out.print("<script> alert ('Acesso Negado'); </script>");
                                out.print("<script> location.href = ('login.jsp'); </script>");
                            }
                        }
                    }
                    break;
                    case "status": {
                        try {
                            uLogado = (Usuario) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        try {
                            uLogadoC = (Cliente) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        p.setId(Integer.parseInt(id));
                        p.carregaPorId(p.getId());
                        p.setStatus(status);
                        if (uLogado.getId() != 0) {
                            switch (uLogado.getPerfil().getId()) {
                                case 1: {
                                    p.alteraStatus();
                                }
                                break;
                                case 2: {
                                    p.alteraStatus();
                                }
                                break;
                                case 3: {
                                    p.alteraStatus();
                                }
                                break;
                                default: {
                                    out.print("<script> alert ('Acesso Negado'); </script>");
                                    out.print("<script> location.href = ('login.jsp'); </script>");
                                }
                                break;
                            }
                            response.sendRedirect("listar_pedido.jsp");
                        } else if (uLogadoC.getId() != 0) {
                            if (p.getCliente().getId() == uLogadoC.getId()) {
                                p.alteraStatus();
                                response.sendRedirect("pedidos.jsp");
                            } else {
                                out.print("<script> alert ('Acesso Negado'); </script>");
                                out.print("<script> location.href = ('login.jsp'); </script>");
                            }
                        } else {
                            out.print("<script> alert ('Acesso Negado'); </script>");
                            out.print("<script> location.href = ('login.jsp'); </script>");
                        }
                    }
                    break;
                    case "adicionar": {
                        try {
                            uLogado = (Usuario) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        try {
                            uLogadoC = (Cliente) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        if (uLogado.getId() == 0 && uLogadoC.getId() == 0) {
                            out.print("<script>alert('é necessário estar logado para fezer um pedido');</script>");
                            out.print("<script>location.href=('login.jsp');</script>");
                        } else {
                            try {
                                if (uLogado.getId() != 0 && carrinho != null) {
                                    Carrinho ca = new Carrinho();
                                    Produto pdAdd = new Produto();
                                    pdAdd.setId(Integer.parseInt(id));
                                    pdAdd.carregaPorId(Integer.parseInt(id));

                                    for (int i = 0; i < carrinho.size(); i++) {
                                        Carrinho pca = (Carrinho) carrinho.get(i);
                                        if (pca.getProduto().getId() == pdAdd.getId()) {
                                            pdAdd.setQtd(pca.getQtd() + 1);
                                            pca.setQtd(pdAdd.getQtd());
                                            pca.setTamanho(tamanho);
                                            pca.setProduto(pdAdd);
                                            pca.setPrecoUnitario(pdAdd.getPrecoUnitario());
                                            carrinho.set(i, pca);
                                        }
                                    }
                                    if (pdAdd.getQtd() == 0) {
                                        pdAdd.setQtd(1);
                                        ca.setQtd(pdAdd.getQtd());
                                        ca.setTamanho(tamanho);
                                        ca.setProduto(pdAdd);
                                        ca.setPrecoUnitario(pdAdd.getPrecoUnitario());
                                        carrinho.add(ca);                                        
                                    }
                                    value = 0.0;
                                    for (int i = 0; i < carrinho.size(); i++) {
                                        Carrinho pca = (Carrinho) carrinho.get(i);
                                        value += (pca.getPrecoUnitario() * pca.getQtd());
                                    }
                                    session.setAttribute("carrinho", carrinho);
                                    session.setAttribute("total", value);
                                    out.print("<script> alert('Produto Adicionado ao Carrinho');</script>");
                                    if (src.equals("carrinho")) {
                                        out.print("<script>location.href=('carrinho_u.jsp');</script>");
                                    } else if (src.equals("lista")) {
                                        out.print("<script>location.href=('form_inserir_pedido.jsp');</script>");
                                    }
                                }
                            } catch (Exception e) {
                            }
                            try {
                                if (uLogadoC.getId() != 0 && carrinho != null) {
                                    Carrinho ca = new Carrinho();
                                    Produto pdAdd = new Produto();
                                    pdAdd.setId(Integer.parseInt(id));
                                    pdAdd.carregaPorId(Integer.parseInt(id));

                                    for (int i = 0; i < carrinho.size(); i++) {
                                        Carrinho pca = (Carrinho) carrinho.get(i);
                                        if (pca.getProduto().getId() == pdAdd.getId()) {
                                            pdAdd.setQtd(pca.getQtd() + 1);
                                            pca.setQtd(pdAdd.getQtd());
                                            pca.setTamanho(tamanho);
                                            pca.setProduto(pdAdd);
                                            pca.setPrecoUnitario(pdAdd.getPrecoUnitario());
                                            carrinho.set(i, pca);
                                        }
                                    }
                                    if (pdAdd.getQtd() == 0) {
                                        pdAdd.setQtd(1);
                                        ca.setQtd(pdAdd.getQtd());
                                        ca.setTamanho(tamanho);
                                        ca.setProduto(pdAdd);
                                        ca.setPrecoUnitario(pdAdd.getPrecoUnitario());
                                        carrinho.add(ca);                                        
                                    }
                                    value = 0.0;
                                    for (int i = 0; i < carrinho.size(); i++) {
                                        Carrinho pca = (Carrinho) carrinho.get(i);
                                        value += (pca.getPrecoUnitario() * pca.getQtd());
                                    }
                                    session.setAttribute("carrinho", carrinho);
                                    session.setAttribute("total", value);
                                    out.print("<script> alert('Produto Adicionado ao Carrinho');</script>");
                                    if (src.equals("carrinho")) {
                                        out.print("<script>location.href=('checkout.jsp');</script>");
                                    } else if (src.equals("lista")) {
                                        out.print("<script>location.href=('cardapio.jsp');</script>");
                                    }
                                }
                            } catch (Exception e) {
                                out.print("<script> alert ('Ocorreu um erro: " + e + "'); </script>");
                            }
                        }
                    }
                    break;
                    case "remover": {
                        try {
                            uLogado = (Usuario) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        try {
                            uLogadoC = (Cliente) session.getAttribute("usuario");
                        } catch (Exception e) {
                        }
                        if (uLogado.getId() != 0) {
                            int index = Integer.parseInt(id);                            
                            Carrinho pca = (Carrinho) carrinho.get(index);
                            for (int i = 0; i < carrinho.size(); i++) {
                                if (i == index) {
                                    if (pca.getQtd() == 1) {
                                        carrinho.remove(index);
                                        value -= pca.getPrecoUnitario();
                                    } else if (pca.getQtd() > 1) {
                                        value -= (pca.getPrecoUnitario() * pca.getQtd());
                                        pca.setQtd(pca.getQtd() - 1);
                                        carrinho.set(index, pca);
                                    }
                                }
                            }
                            value = 0.0;
                            for (int i = 0; i < carrinho.size(); i++) {
                                Carrinho pcav = (Carrinho) carrinho.get(i);
                                value += (pcav.getPrecoUnitario() * pcav.getQtd());
                            }
                            session.setAttribute("total", value);
                            session.setAttribute("carrinho", carrinho);
                            out.print("<script> alert('Produto Removido do Carrinho');</script>");
                            out.print("<script>location.href=('carrinho_u.jsp');</script>");
                        } else if (uLogadoC.getId() != 0) {
                            int index = Integer.parseInt(id);
                            Carrinho pca = (Carrinho) carrinho.get(index);
                            for (int i = 0; i < carrinho.size(); i++) {
                                if (i == index) {
                                    if (pca.getQtd() == 1) {
                                        carrinho.remove(index);
                                        value -= pca.getPrecoUnitario();
                                    } else if (pca.getQtd() > 1) {
                                        value -= (pca.getPrecoUnitario() * pca.getQtd());
                                        pca.setQtd(pca.getQtd() - 1);
                                        carrinho.set(index, pca);
                                    }
                                }
                            }
                            value = 0.0;
                            for (int i = 0; i < carrinho.size(); i++) {
                                Carrinho pcav = (Carrinho) carrinho.get(i);
                                value += (pcav.getPrecoUnitario() * pcav.getQtd());
                            }
                            session.setAttribute("total", value);
                            session.setAttribute("carrinho", carrinho);
                            out.print("<script> alert('Produto Removido do Carrinho');</script>");
                            out.print("<script>location.href=('checkout.jsp');</script>");
                        } else {
                            out.print("<script> alert ('Acesso Negado'); </script>");
                            out.print("<script> location.href = ('login.jsp'); </script>");
                        }
                    }
                    break;
                }
            } catch (Exception e) {
                out.print("<script> alert ('Ocorreu um erro: " + e + "'); </script>");
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
