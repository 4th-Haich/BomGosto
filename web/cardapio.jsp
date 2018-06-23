<%@page import="java.util.ArrayList"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.Cliente"%>
<%
    ArrayList<Produto> lista = new ArrayList<Produto>();
    try {
        Produto pd = new Produto();
        lista = pd.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    try {
        if (session.getAttribute("carrinho").equals(null)) {
            ArrayList carrinho = new ArrayList();
            double total = 0.0;
            session.setAttribute("carrinho", carrinho);
            session.setAttribute("total", total);
        }
    } catch (Exception e) {
        out.print("Erro: " + e);
        ArrayList carrinho = new ArrayList();
        double total = 0.0;
        session.setAttribute("carrinho", carrinho);
        session.setAttribute("total", total);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Restaurante" />
        <meta name="author" content="FPDCVA" />
        <title>Bom Gosto</title>


        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/contact-buttons.css" rel="stylesheet">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>

        <!---pop-up-box---->
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!---//pop-up-box---->

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="js/html5shiv.js"></script>
            <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>	       
        <!-- /////////////////////////////////////////Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="images/logo.png" class="hidden-xs" alt="">
                        <h3 class="visible-xs">Bom Gosto</h3>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <%@include file="navbar_c.jsp"%>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="box-content box-2 box-style" id="menu">
            <div class="container">
                <div class="row heading">
                    <div class="col-lg-12">	
                        <h2>Cardapio</h2>
                        <div class="row"> 
                            <div class="panel-body table-responsive">
                                <a class="btn btn-warning" href="checkout.jsp"><em class="fa fa-cart-plus"></em> Carrinho</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">                        
                    <% for (Produto p : lista) {%>
                    <div class="col-xs-6">
                        <div class="box-item">
                            <div class="col-sm-6">
                                <div class="media"><img class="media__image " height="450" width="640" src="images/produtos/<%=p.getImagem()%>">
                                    <div class="media__body">
                                        <h2>R$ <%=p.getPrecoUnitario()%></h2>                                           
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="wrapper">
                                    <h3><%=p.getNome()%></h3>
                                    <p>Preço: R$ <%=p.getPrecoUnitario()%> <br/> Categoria: <%=p.getCategoria().getNome()%><br/></p>                                    
                                    <div class="container-fluid">
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
                                            } else if (p.getCategoria().getNome().equals("Bebida")) {%>
                                            <option value="800">800 Ml</option>
                                            <option value="500">500 Ml</option>
                                            <option value="300">300 Ml</option>
                                            <%}%>                                        
                                        </select>                                        
                                        <%
                                            if (uLogadoC.getId() != 0) {
                                                out.print("<button type='submit' class='btn btn-success' ><em class='fa fa-cart-plus'></em> Adicionar</button>");
                                            }
                                        %>
                                    </form>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <% }%>

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
        <!-- Footer -->

        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backTop.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#backTop').backTop({
                    'position': 1200,
                    'speed': 500,
                    'color': 'red'
                });
            });
        </script>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
        <!-- Bootstrap Core JavaScript -->
    </body>
</html>
