<%@page import="model.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Categoria> listac = new ArrayList<Categoria>();
    try {
        Categoria cat = new Categoria();
        listac = cat.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
                <div class="row row-offcanvas row-offcanvas-left">
                    <div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebarRight" role="navigation">
                        <div class="well sidebar-nav">
                            <% for (Categoria c : listac) {%>  
                            <ul class="nav">
                                <li class="tab active"><a href="#<%=c.getNome()%>"><%=c.getNome()%></a></li>
                            </ul>
                            <% }%>
                        </div><!--/.well -->
                    </div><!--/span-->
                    <div class="col-xs-12 col-sm-8 panel panel-default">
                        <div> 
                            <% for (Categoria c : listac) {%>  
                            <div class="tab-content ">
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
                                                    <a href="gerenciar_pedido.do?id=<%=p.getId()%>&op=adicionar">
                                                        <div class="media">
                                                            <img class="media__image " src="images/<%=p.getImagem()%>">
                                                            <div class="media__body">
                                                                <h2>R$ <%=p.getPrecoUnitario()%></h2>                                           
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="wrapper">
                                                        <h3><%=p.getNome()%></h3>
                                                        <p>R$ <%=p.getPrecoUnitario()%>                                                       
                                                        <a class="btn btn-success"  href="gerenciar_pedido.do?id=<%=p.getId()%>&op=adicionar"><em class="fa fa-cart-plus"></em> Comprar</a></p>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <%}%>
                                        <%}%>
                                    </div>
                                </div>                        
                            </div><!-- tab-content --> 
                            <% }%>                  
                        </div>
                    </div><!--/row-->
                </div><!--/span-->
            </div><!--/row-->

        </section>
        <div class="coppy-right">
            <div class="wrap-footer">
                <div class="clearfix">
                    <div class="col-md-6 col-md-offset-3">
                        <p>Copyright 2017</p>
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
        <script src="js/login.js"></script><script src="js/jquery.min.js"></script>
    </body>
</html>
