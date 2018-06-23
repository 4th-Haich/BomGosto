<%@page import="java.util.ArrayList"%>
<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.Produto" %>
<%@page import="model.Cliente"%>
<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cliente uLogadoCL = new Cliente();
    ArrayList<Pedido> lista = new ArrayList<Pedido>();
    try {
        uLogadoCL = (Cliente) session.getAttribute("usuario");
        Pedido pd = new Pedido();
        lista = pd.carregaPorCliente(uLogadoCL.getId());
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    NumberFormat fm = NumberFormat.getCurrencyInstance();
%>

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


        <link href="css/data/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <!---//pop-up-box----> 

        <script>
            function cancelar(id) {
                var url = "gerenciar_pedido.do?op=status&id=" + id + "&status=Cancelado";
                if (confirm("Tem certeza que quer cancelar o pedido?")) {
                    window.open(url, '_self');
                }
            }
        </script>  

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
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col col-xs-12">
                                    <h3 class="panel-title">Lista de Pedidos</h3>                                    
                                </div>
                            </div>
                            <div>
                                <button type="button" class="btn btn-sm btn-primary btn-create" onclick="window.location.href = 'cardapio.jsp'"><em class="glyphicon glyphicon-plus"></em> Novo</button>
                                <button type="button" class="btn btn-sm btn-warning btn-create" onclick="atualizar()"><em class="glyphicon glyphicon-refresh"></em> Atualizar</button>
                            </div>
                        </div>
                        <div class="panel-body table-responsive">
                            <form action="gerenciar pedido.do" method="post">
                                <input type="hidden" name="op" value="status">
                                <table  id="pedidos" class="table table-striped table-bordered table-list table-hover table-filter">                                
                                    <thead>
                                        <tr>
                                            <th class="center">Código</th>
                                            <th class="center">Data do Pedido</th>                                            
                                            <th class="center">Obs.</th>
                                            <th class="center">Status</th>
                                            <th class="center">Tipo de Pagamento</th>
                                            <th class="center">Preço Final</th>                                        
                                            <th class="center"><em class="fa fa-cog"></em> Opções</th>
                                        </tr> 
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th class="center">Código</th>
                                            <th class="center">Data do Pedido</th>                                            
                                            <th class="center">Obs.</th>
                                            <th class="center">Status</th>
                                            <th class="center">Tipo de Pagamento</th>
                                            <th class="center">Preço Final</th>                                        
                                            <th class="center"><em class="fa fa-cog"></em> Opções</th>
                                        </tr> 
                                    </tfoot>
                                    <tbody>
                                        <% for (Pedido p : lista) {%>
                                        <%if (uLogadoCL.getId() == p.getCliente().getId()) {%>
                                        <tr>
                                            <td class="center"><%=p.getId()%></td>
                                            <td class="center"><%=p.getDataPedido()%></td>                                            
                                            <td class="center"><%=p.getObs()%></td>
                                            <td class="center">
                                                <% if ("Em Espera".equals(p.getStatus())) {
                                                        out.print("<span class='label label-warning'>" + p.getStatus() + "</span>");
                                                    } else if ("Atendendo".equals(p.getStatus())) {
                                                        out.print("<span class='label label-default'>" + p.getStatus() + "</span>");
                                                    } else if ("Saiu para entrega".equals(p.getStatus())) {
                                                        out.print("<span class='label label-info'>" + p.getStatus() + "</span>");
                                                    } else if ("Finalizado".equals(p.getStatus())) {
                                                        out.print("<span class='label label-success'>" + p.getStatus() + "</span>");
                                                    } else if ("Cancelado".equals(p.getStatus())) {
                                                        out.print("<span class='label label-danger'>" + p.getStatus() + "</span>");
                                                    }
                                                %>
                                            </td>
                                            <td class="center"><%=p.getTipoPagamento()%></td>
                                            <td class="center"><%out.print(fm.format(p.getPrecoFinal()));%></td>                                        
                                            <td class="center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <em class="fa fa-cog"></em> Opções <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu dropdown-menu-right">   
                                                        <%
                                                            if (p.getStatus().equals("Em Espera")) {

                                                        %>
                                                        <li><a href="details_pedido_c.jsp?id=<%=p.getId()%>"><em class="glyphicon glyphicon-list-alt"></em> Detalhes</a> </li>
                                                        <li><a onclick="cancelar(<%=p.getId()%>)"><em class="glyphicon glyphicon-remove"></em> Cancelar</a></li>
                                                            <%
                                                            } else if (p.getStatus().equals("Atendendo")) {
                                                            %>
                                                        <li><a href="details_pedido_c.jsp?id=<%=p.getId()%>"><em class="glyphicon glyphicon-list-alt"></em> Detalhes</a> </li>
                                                        <li> <a onclick="cancelar(<%=p.getId()%>)"><em class="glyphicon glyphicon-remove"></em> Cancelar</a></li>
                                                            <%
                                                            } else {
                                                            %>
                                                        <li><a href="details_pedido_c.jsp?id=<%=p.getId()%>"><em class="glyphicon glyphicon-list-alt"></em> Detalhes</a> </li>
                                                            <%
                                                                }
                                                            %>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>  
                                        <% }%> 
                                        <% }%>                                           
                                    </tbody>
                                </table>
                            </form>
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
        <!-- Footer -->

        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script>      
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>

        <script src="js/data/jquery.dataTables.min.js"></script>   
        <script src="js/data/dataTables.bootstrap.min.js"></script> 
        <script>
                                                            function atualizar() {
                                                                location.reload();
                                                            }
        </script>
        <script>
            $(document).ready(function () {
                $('#pedidos').DataTable({
                    "language": {
                        "sEmptyTable": "Nenhum registro encontrado",
                        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                        "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sInfoThousands": ".",
                        "sLengthMenu": "_MENU_ resultados por página",
                        "sLoadingRecords": "Carregando...",
                        "sProcessing": "Processando...",
                        "sZeroRecords": "Nenhum registro encontrado",
                        "sSearch": "Pesquisar",
                        "oPaginate": {
                            "sNext": "Próximo",
                            "sPrevious": "Anterior",
                            "sFirst": "Primeiro",
                            "sLast": "Último"
                        },
                        "oAria": {
                            "sSortAscending": ": Ordenar colunas de forma ascendente",
                            "sSortDescending": ": Ordenar colunas de forma descendente"
                        }
                    }
                });
            });
        </script>   
    </body>
</html>
