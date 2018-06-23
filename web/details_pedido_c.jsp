<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Cliente> lista_cliente = new ArrayList<Cliente>();
    ArrayList<Usuario> lista_usuario = new ArrayList<Usuario>();
    Pedido p = new Pedido();
    Cliente uLogadoCL = new Cliente();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Pedido pd = new Pedido();
        p = pd.carregaPorId(id);

        Cliente ct = new Cliente();
        lista_cliente = ct.listar();
        Usuario us = new Usuario();
        lista_usuario = us.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }

    ArrayList<Produto> lista = new ArrayList<Produto>();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto pd = new Produto();
        lista = pd.carregaPedidoProduto(id);

    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    NumberFormat fm = NumberFormat.getCurrencyInstance();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes do Pedido</title>              
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Bom Gosto" />
        <meta name="author" content="Parceria" />


        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/details_pedido.css" rel='stylesheet' type='text/css' />

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!---//pop-up-box---->
        <link rel="stylesheet" href="css/normalize.min.css">
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
        <!-- ////////////Content Box 02 -->
        <%try {
                uLogadoCL = (Cliente) session.getAttribute("usuario");
                if (uLogadoCL.getId() != 0) {
        %>
        <section class="box-content box-2 box-style">
            <div class="container">
                <div class="row">
                    <div class="">
                        <div class="c panel with-nav-tabs panel-primary">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#pedido" role="tab" data-toggle="tab">Pedido</a></li>
                                    <li><a href="#produto" role="tab" data-toggle="tab" >Produto</a></li>
                                </ul>
                            </div>
                            <div class="panel-body">
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="pedido">
                                        <div class="container">
                                            <div>
                                                <div class="col-sm-6 col-sm-offset-4">
                                                    <h1 class="infolist"> Detalhes do Pedido</h1>
                                                </div>
                                                <div class="">
                                                    <form class="form-horizontal">

                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Código</label>  
                                                            <div class="col-md-4">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>                                   
                                                                    <input class="form-control" type="text" value="<%=p.getId()%>" disabled>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Data do Pedido</label>  
                                                            <div class="col-md-4">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>                                   
                                                                    <input class="form-control" type="text" value="<%=p.getDataPedido()%>" disabled>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Observação</label>  
                                                            <div class="col-md-4">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
                                                                    <input class="form-control" name="unidadeMedida" type="text"  value="<%=p.getObs()%>" disabled>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Status</label>  
                                                            <div class="col-md-4">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-stats"></i></span>
                                                                    <input class="form-control" type="text"  value="<%=p.getStatus()%>" disabled>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Tipo Pagamento</label>  
                                                            <div class="col-md-4 ">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                                                    <input class="form-control" type="text"  value="<%=p.getTipoPagamento()%>" disabled>
                                                                </div>
                                                            </div>
                                                        </div>        
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Preço Final</label>  
                                                            <div class="col-md-4 ">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                                                    <input class="form-control" type="text"  value="<%=fm.format(p.getPrecoFinal())%>" disabled>
                                                                </div>
                                                            </div>
                                                        </div>   
                                                        <div class="form-group"> 
                                                            <label class="col-md-4 control-label">Usuário</label>
                                                            <div class="col-md-4 selectContainer">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                                    <input class="form-control" type="text"  value="<%=p.getUsuario().getNome()%>" disabled>                                     
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                    <!-- Button (Double) -->
                                                    <div class="form-group">
                                                        <label class="col-md-4 control-label"></label>
                                                        <div class="col-md-8">
                                                            <% if ("Em Espera".equals(p.getStatus())) {
                                                                    out.print("<button class='btn btn-danger' ' onclick='cancelar(" + p.getId() + ")' ><em class='glyphicon glyphicon-remove'></em> Cancelar</button>");
                                                                } else if ("Atendendo".equals(p.getStatus())) {
                                                                    out.print("<button class='btn btn-danger' ' onclick='cancelar(" + p.getId() + ")'><em class='glyphicon glyphicon-remove'></em> Cancelar</button>");
                                                                }

                                                            %>
                                                            <button class="btn btn-primary" onclick="window.location.href = 'pedidos.jsp'"><span class="fa fa-reply "></span> Voltar</button>
                                                        </div>
                                                    </div>
                                                    <br><br> 
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="produto">
                                        <!--  next div Pet infomation-->
                                        <div class="container">
                                            <div class="row listnow">
                                                <div class="col-sm-6 col-sm-offset-4">
                                                    <h1 class="infolist"> Detalhes do Produto</h1>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="panel-body table-responsive">
                                                        <table  id="results" role="form" class="table table-striped table-bordered table-list table-hover form-horizontal">
                                                            <thead>
                                                                <tr>
                                                                    <th class="center">Código</th>
                                                                    <th class="center">Nome</th>
                                                                    <th class="center">Quantidade</th> 
                                                                    <th class="center">Tamanho</th> 
                                                                    <th class="center">Preço</th>
                                                                    <th class="center">Sub Total</th>
                                                                    <th class="center">Categoria</th>                                                                    
                                                                </tr> 
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <th class="center">Código</th>
                                                                    <th class="center">Nome</th> 
                                                                    <th class="center">Quantidade</th> 
                                                                    <th class="center">Tamanho</th> 
                                                                    <th class="center">Preço</th>
                                                                    <th class="center">Sub Total</th>
                                                                    <th class="center">Categoria</th>                                                                   
                                                                </tr> 
                                                            </tfoot>
                                                            <tbody>
                                                                <% for (Produto pp : lista) {%>
                                                                <tr>
                                                                    <td class="center"><%=pp.getId()%></td>
                                                                    <td class="center"><%=pp.getNome()%></td>
                                                                    <td class="center"><%=pp.getQtd()%></td>    
                                                                    <td class="center"><%=pp.getTamanho()%></td>    
                                                                    <td class="center"><%=fm.format(pp.getPrecoUnitario())%></td>
                                                                    <td class="center"><%out.print(fm.format(pp.getPrecoUnitario() * pp.getQtd()));%></td>
                                                                    <td class="center"><%=pp.getCategoria().getNome()%></td>
                                                                </tr> 
                                                                <% }%>                                             
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- Button (Double) -->
                                                    <div class="form-group">
                                                        <label class="col-md-4 control-label"></label>
                                                        <div class="col-md-8">
                                                            <% if ("Em Espera".equals(p.getStatus())) {
                                                                    out.print("<button class='btn btn-danger' ' onclick='cancelar(" + p.getId() + ")' ><em class='glyphicon glyphicon-remove'></em> Cancelar</button>");
                                                                } else {
                                                                    if ("Atendendo".equals(p.getStatus())) {
                                                                        out.print("<button class='btn btn-danger' ' onclick='cancelar(" + p.getId() + ")'><em class='glyphicon glyphicon-remove'></em> Cancelar</button>");
                                                                    }
                                                                }
                                                            %>
                                                            <button class="btn btn-primary" onclick="window.location.href = 'pedidos.jsp'"><span class="fa fa-reply "></span> Voltar</button>
                                                        </div>
                                                    </div>
                                                    <br><br>                                                    
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%
                }
            } catch (Exception e) {
                response.sendRedirect("login.jsp");
            }%>

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
                                                                function cancelar(id) {
                                                                    var url = "gerenciar_pedido.do?op=status&id=" + id + "&status=Cancelado";
                                                                    if (confirm("Tem certeza que quer cancelar o pedido?")) {
                                                                        window.open(url, '_self');
                                                                    }
                                                                }
        </script>  
        <script>
            $(document).ready(function () {
                $('#backTop').backTop({
                    'position': 1200,
                    'speed': 500,
                    'color': 'red',
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

