<%@page import="model.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Categoria> listac = new ArrayList<Categoria>();
    try {
        Categoria ct = new Categoria();
        listac = ct.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    try {
        int cliente = Integer.parseInt(request.getParameter("id"));
        session.setAttribute("cliente", cliente);

    } catch (Exception e) {
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Pedido</title>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!---//pop-up-box---->
        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/onepage.css"> 
    </head>
    <body>
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
                    </ul>
                </div>
            </div>
        </nav>
        <section class="box-content box-2 box-style">
            <div class="container">
                <div class="">
                    <div class="col-md-2">
                        <div class="well sidebar-nav">
                            <ul class="nav">
                                <li>
                                    <button class="btn btn-warning" onclick="window.location.href = 'carrinho_u.jsp'"><em class="fa fa-cart-plus"></em> Carrinho</button>
                                </li>
                                <% for (Categoria c : listac) {%>  
                                <li class="tab active"><a href="#<%=c.getNome()%>"><%=c.getNome()%></a></li>
                                    <% }%>
                            </ul>
                        </div><!--/.well -->
                    </div><!--/span-->
                    <div class="col-md-8 panel panel-default">
                        <div class="tab-content "> 
                            <% for (Categoria c : listac) {%>                              
                            <div id="<%=c.getNome()%>">   
                                <h3 class="panel-heading panel-title"><%=c.getNome()%></h3>
                                <%    ArrayList<Produto> listap = new ArrayList<Produto>();
                                    try {
                                        Produto pd = new Produto();
                                        listap = pd.listar();
                                    } catch (Exception e) {
                                        out.print("Erro: " + e);
                                    }
                                %>                            
                                <div class="row"> 
                                    <% for (Produto p : listap) {%>
                                    <%if (c.getId() == p.getCategoria().getId()) {%>
                                    <div class="col-xs-6">
                                        <div class="box-item">
                                            <div class="col-sm-6">                                                
                                                <div class="media">
                                                    <img class="media__image " src="images/produtos/<%=p.getImagem()%>">
                                                    <div class="media__body">
                                                        <h2>R$ <%=p.getPrecoUnitario()%></h2>                                           
                                                    </div>
                                                </div>                                                
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="wrapper">                                                   
                                                        <h3><%=p.getNome()%></h3>
                                                        <p>Preço: R$ <%=p.getPrecoUnitario()%> <br/></p>                                                                        
                                                        <form action="gerenciar_pedido.do?src=lista" method="post">
                                                            <input type="hidden" name="id" value="<%=p.getId()%>">
                                                            <input type="hidden" name="op" value="adicionar">
                                                            <input type="hidden" name="id" value="<%=p.getId()%>">
                                                            <select name="tamanho" class="form-control">
                                                                <%
                                                                    if (p.getCategoria().getNome().equals("Pizza")) {
                                                                %>
                                                                <option value="Grande">Grande</option>
                                                                <option value="Média">Média</option>
                                                                <option value="Pequena">Pequena</option>                                        
                                                                <%
                                                                } else if (p.getCategoria().getNome().equals("Bebida")) {
                                                                %>
                                                                <option value="800">800 Ml</option>
                                                                <option value="500">500 Ml</option>
                                                                <option value="300">300 Ml</option>
                                                                <%}%>                                        
                                                            </select>                                        
                                                            <%
                                                                if (uLogado.getId() != 0) {
                                                                    out.print("<button type='submit' class='btn btn-success' ><em class='fa fa-cart-plus'></em> Adicionar</button>");
                                                                }
                                                            %>
                                                        </form>                                  
                                                </div>
                                            </div>
                                            <div class="clear">                                                       
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                    <%}%>
                                </div>                                                       
                            </div>
                            <% }%>                  
                        </div>
                    </div>
                </div>
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

        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script>    
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/login.js">
        </script><script src="js/jquery.min.js"></script>
    </body>
</html>
