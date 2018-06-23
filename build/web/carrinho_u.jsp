<%@page import="model.PerfilDAO"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.Carrinho"%>
<%@page import="model.Usuario"%>
<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    ArrayList<Produto> lista = new ArrayList<Produto>();
    try {
        Produto pd = new Produto();
        lista = pd.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    Date data = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    String dates = formatter.format(data);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>              
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Bom Gosto" />
        <meta name="author" content="Parceria" />

        <link href="css/data/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!---//pop-up-box---->

    </head>
    <body>
        <%
            Usuario uLogadoU = new Usuario();
        %>
        <!-- /////////////////////////////////////////Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="area_admin.jsp">Bom Gosto</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <%@include file="navbar_u.jsp" %> 
                        <%                            try {
                                uLogadoU = (Usuario) session.getAttribute("usuario");
                            } catch (Exception e) {

                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- ////////////Content Box 02 -->
        <section class="box-content box-2 box-style">
            <div class="container">
                <form action="gerenciar_pedido.do" method="post">   
                    <input type="hidden" name="op" value="inserir"/>
                    <input type="hidden" name="data_pedido"  value="<%=dates%>"/>
                    <input type="hidden" name="status"  value="Em Espera" required/>
                    <input type="hidden" name="preco_final" value="<%out.print(session.getAttribute("total"));%>" required/>
                    <%
                        ArrayList<Perfil> listac = new ArrayList<Perfil>();
                        Cliente c = new Cliente();
                        try {
                            int id = (Integer) (session.getAttribute("cliente"));
                            c.carregaPorId(id);
                        } catch (Exception e) {
                        }
                        if (c.getId() == 0) {
                            c.setId(1);
                        }
                        NumberFormat fm = NumberFormat.getCurrencyInstance();
                    %>
                    <input type="hidden" name="cliente_id" value="<%=c.getId()%>"/>                    
                    <input type="hidden" name="usuario_id" value="<%=uLogadoU.getId()%>"/>                   
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col col-xs-12">
                                        <h3 class="panel-title">Carrinho</h3>                                    
                                    </div>
                                </div>
                                <div>
                                    <button type="button" class="btn btn-sm btn-primary btn-create" onclick="window.location.href = 'form_inserir_pedido.jsp'"><em class="glyphicon glyphicon-plus-sign"></em> Adicionar</button>                              
                                </div>
                            </div>
                            <div class="panel-body table-responsive">
                                <table  id="results" class="table table-striped table-bordered table-list table-hover">
                                    <thead>
                                        <tr>
                                            <th class="center">Código</th>
                                            <th class="center">Nome</th>                                        
                                            <th class="center">Tamanho</th>                                        
                                            <th class="center">Quantidade</th>   
                                            <th class="center">Preço Unitário</th>
                                            <th class="center">Sub Total</th>
                                            <th class="center">Categoria</th>
                                            <th class="center"><em class="fa fa-cog"></em></th>
                                        </tr> 
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th class="center"></th>
                                            <th class="center"></th>
                                            <th class="center"></th>
                                            <th class="center"></th>                                                                       
                                            <th class="center">
                                                <textarea name="obs" rows="1" cols="15" placeholder="Observação"></textarea>
                                            </th>
                                            <th class="center">
                                                <select name="tipo_pagamento" size="1" required>                   
                                                    <option slected value="Dinheiro">Dinheiro</option>
                                                    <option value="Cédito">Cartão Crédito</option> 
                                                    <option value="Débito">Cartão Débito</option> 
                                                </select>
                                            </th>
                                            <th class="center">Total: <%out.print(fm.format(session.getAttribute("total")));%></th>

                                            <th class="center">
                                                <%
                                                    try {
                                                        ArrayList carrinho = (ArrayList) session.getAttribute("carrinho");
                                                        if (carrinho.size() != 0) {
                                                %>
                                                <button class="btn btn-success" type="submit" value="Comprar"><em class="glyphicon glyphicon-ok-sign"></em> Finalizar</button>   
                                                <%
                                                %>                                     
                                            </th>
                                        </tr> 
                                    </tfoot>
                                    <tbody>
                                        <%                                            
                                            for (int i = 0; i < carrinho.size(); i++) {
                                                //Produto p = (Produto) carrinho.get(i);
                                                Carrinho pca = (Carrinho) carrinho.get(i);
                                        %> 
                                        <tr>
                                            <td class="center"><%=pca.getProduto().getId()%></td>
                                            <td class="center"><%=pca.getProduto().getNome()%></td>
                                            <td class="center"><%=pca.getTamanho()%></td>                                                                                                                 
                                            <td class="center">
                                                <a class="btn btn-danger" href="gerenciar_pedido.do?op=remover&id=<%=i%>">
                                                    <em class="fa fa-minus"></em>
                                                </a>
                                                <span style="padding: 10px;"> 
                                                <%=pca.getQtd()%>
                                                 </span>
                                                <a class="btn btn-success" href="gerenciar_pedido.do?id=<%=pca.getProduto().getId()%>&tamanho=<%=pca.getTamanho()%>&op=adicionar&src=carrinho"> 
                                                    <em class="fa fa-plus">                                                    
                                                    </em>
                                                </a>
                                            </td>
                                            <td class="center"><%out.print(fm.format(pca.getProduto().getPrecoUnitario()));%></td>
                                            <td class="center"><%out.print(fm.format(pca.getProduto().getPrecoUnitario() * pca.getQtd()));%></td>
                                            <td class="center"><%=pca.getProduto().getCategoria().getNome()%></td>
                                            <td class="center">                                   
                                                <a class="btn btn-danger" href="gerenciar_pedido.do?op=remover&id=<%=i%>"><em class="glyphicon glyphicon-remove-sign"></em> Remover</a>
                                            </td>
                                        </tr>  
                                        <%
                                            }
                                        %>
                                    </tbody>
                                    <%
                                            } else {
                                                out.println("<em class='fa fa-cog'></em></th>");
                                                out.println("</tr>");
                                                out.println("</tfoot>");
                                                out.println("<tbody>");
                                                out.println("<tr>");
                                                if (uLogado.getId() == 0) {
                                                    out.println("<td class='center' colspan=9>Faça login para fazer um pedido</td>");
                                                } else {
                                                    out.println("<td class='center'></td>");
                                                    out.println("<td class='center'></td>");
                                                    out.println("<td class='center'></td>");
                                                    out.println("<td class='center'></td>");
                                                    out.println("<td class='center'></td>");
                                                    out.println("<td class='center'></td>");
                                                    out.println("<td class='center'></td>");
                                                }
                                                out.println("</tr> ");
                                                out.println("</tbody>");
                                            }
                                        } catch (Exception e) {
out.print(e);
                                        }
                                    %>                                     
                                </table>                               
                            </div>  
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <div class="coppy-right">
            <div class="wrap-footer">
                <div class="clearfix">
                    <div class="col-md-6 col-md-offset-3">
                        <%@include file="copyright.jsp" %> 
                    </div>
                </div>	
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/data/jquery.js"></script>
        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/data/jquery.dataTables.min.js"></script>   
        <script src="js/data/dataTables.bootstrap.min.js"></script> 
        <script src="js/language.js"></script>    
    </body>
</html>           