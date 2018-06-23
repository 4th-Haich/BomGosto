<%@page import="model.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Pedido> lista = new ArrayList<Pedido>();
    try {
        Pedido pd = new Pedido();
        lista = pd.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }

%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pedidos</title>              
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
        <!---//pop-up-box---->     
        <script>
            function atender(id) {
                var url = "gerenciar_pedido.do?op=status&id=" + id + "&status=Atendendo";
                if (confirm("Tem certeza que quer atender o pedido: " + id + "?")) {
                    window.open(url, '_self');
                }
            }
            function entregar(id) {
                var url = "gerenciar_pedido.do?op=status&id=" + id + "&status=Saiu para entrega";
                if (confirm("Tem certeza que quer entregar o pedido: " + id + "?")) {
                    window.open(url, '_self');
                }
            }
            function finalizar(id) {
                var url = "gerenciar_pedido.do?op=status&id=" + id + "&status=Finalizado";
                if (confirm("Tem certeza que quer finalizar o pedido: " + id + "?")) {
                    window.open(url, '_self');
                }
            }
            function cancelar(id) {
                var url = "gerenciar_pedido.do?op=status&id=" + id + "&status=Cancelado";
                if (confirm("Tem certeza que quer cancelar o pedido: " + id + "?")) {
                    window.open(url, '_self');
                }
            }
        </script> 
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
        <!-- ////////////Content Box 02 -->
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
                                <button type="button" class="btn btn-sm btn-primary btn-create" onclick="window.location.href = 'form_inserir_pedido.jsp'"><em class="glyphicon glyphicon-plus"></em> Novo Pedido</button>
                                <button type="button" class="btn btn-sm btn-warning btn-create" onclick="atualizar()"><em class="glyphicon glyphicon-refresh"></em> Atualizar</button>
                            </div>
                        </div>
                        <div class="panel-body table-responsive">
                            <table  id="results" class="table table-striped table-bordered table-list table-hover table-filter">
                                <thead>
                                    <tr>
                                        <th class="center">Código</th>
                                        <th class="center">Data do Pedido</th> 
                                        <th class="center">Cliente</th>
                                        <th class="center">Status</th>
                                        <th class="center"><em class="fa fa-cog"></em> Opções</th>
                                    </tr> 
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th class="center">Código</th>
                                        <th class="center">Data do Pedido</th>
                                        <th class="center">Cliente</th>
                                        <th class="center">Status</th>
                                        <th class="center"><em class="fa fa-cog"></em> Opções</th>
                                    </tr> 
                                </tfoot>
                                <tbody>
                                    <% for (Pedido p : lista) {%>
                                    <tr class="center">
                                        <td><%=p.getId()%></td>
                                        <td><%=p.getDataPedido()%></td>
                                        <td><%=p.getCliente().getNome()%></td>
                                        <td>
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
                                        <td class="center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <em class="fa fa-cog"></em> Opções <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a href="details_pedido.jsp?id=<%=p.getId()%>"><em class="glyphicon glyphicon-list-alt"></em> Detalhes</a> </li>
                                                        <% if ("Em Espera".equals(p.getStatus())) {
                                                                out.print("<li><a ' onclick='atender(" + p.getId() + " )' ><em class='glyphicon glyphicon-stats'></em> Atender</a></li>");
                                                                out.print("<li><a  ' onclick='cancelar(" + p.getId() + " )' ><em class='glyphicon glyphicon-remove'></em> Cancelar</a></li>");
                                                            } else if ("Atendendo".equals(p.getStatus())) {
                                                                out.print("<li><a ' onclick='entregar(" + p.getId() + ")' ><span class='glyphicon glyphicon-stats'></span> Saiu para entrega</a></li>");
                                                                out.print("<li><a ' onclick='cancelar(" + p.getId() + ")'><em class='glyphicon glyphicon-remove'></em> Cancelar</a></li>");
                                                            } else if ("Saiu para entrega".equals(p.getStatus())) {
                                                                out.print("<li><a ' onclick='finalizar(" + p.getId() + " )'><span class='glyphicon glyphicon-stats'></span> Finalizar</a></li>");
                                                            }
                                                        %>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>  
                                    <% }%>                                           
                                </tbody>
                            </table>
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
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/data/jquery.js"></script>
        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/data/jquery.dataTables.min.js"></script>   
        <script src="js/data/dataTables.bootstrap.min.js"></script> 
        <script>
                                    function atualizar() {
                                        location.reload();
                                    }
        </script>
        <script>
            $(document).ready(function () {
                $('#results').DataTable({
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
