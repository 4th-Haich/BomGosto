<%@page import="model.Perfil"%>
<%@page import="model.Menu"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Menu> listaMenu = new ArrayList<Menu>();
    Perfil p = new Perfil();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        p.carregaPorId(id);
        listaMenu = p.carregaMenusNaoPerfil(id);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gereciar Menu Perfil</title>              
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
        <!---//pop-up-box---->

        <script type="text/javascript">
            function excluir(id_perfil, id_menu, titulo) {
                var url = "gerenciar_menu_perfil.do?op=desvincular&id_perfil=" + id_perfil + "&id_menu=" + id_menu;
                if (confirm("Tem certeza que quer desvincular o Menu: " + titulo + "?")) {
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
                                    <h3 class="panel-title">Gerenciar Menu Perfil</h3>                                    
                                </div>
                            </div>
                            <div class="center">
                                <form class="form-inline " name="form_vincular" action="gerenciar_menu_perfil.do" method="post">                                    
                                    <label for="inlineFormInput">Código</label>
                                    <input type="text" class="form-control " id="inlineFormInput" value="<%=p.getId()%>" disabled>
                                    <label for="inlineFormInput">Perfil</label>
                                    <input type="text" class="form-control " id="inlineFormInput" value="<%=p.getNome()%>" disabled>
                                    <input type="hidden" name="id_perfil" value="<%=p.getId()%>"/>
                                    <input type="hidden" name="op" value="vincular"/>
                                    <label for="sel1">Menu:</label>
                                    <select class="form-control" id="id_menu" name="id_menu" required>
                                        <option value="">Selecione...</option>
                                        <% for (Menu m : listaMenu) {%>
                                        <option value="<%=m.getId()%>"><%=m.getTitulo()%></option>
                                        <% } %>
                                    </select>
                                    <button type="submit" class="btn btn-primary" type="submit" ><em class="glyphicon glyphicon-plus"></em> Vincular</button>
                                    <button class="btn btn-danger" onclick="window.location.href = 'listar_perfil.jsp';return false;"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                                </form>                               
                            </div>
                        </div>
                        <div class="panel-body table-responsive center">
                            <table  id="results" class="table table-striped table-bordered table-list table-hover">
                                <thead>
                                    <tr>
                                        <th class="center">Código</th>
                                        <th class="center">Nome</th>
                                        <th class="center"><em class="fa fa-cog"></em></th>
                                    </tr> 
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th class="center">Código</th>
                                        <th class="center">Nome</th>
                                        <th class="center"><em class="fa fa-cog"></em></th>
                                    </tr> 
                                </tfoot>
                                <tbody>
                                    <% for (Menu m : p.getListaMenu()) {%>
                                    <tr>
                                        <td><%=m.getId()%></td>
                                        <td><%=m.getTitulo()%></td>
                                        <td>
                                            <a class="btn btn-danger" href="#" onclick="excluir(<%=p.getId()%>,<%=m.getId()%>, '<%=m.getTitulo()%>')"><em class="glyphicon glyphicon-trash"></em> Remover</a>
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
                        <p>Copyright ©2017 - Parceria</p>
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
