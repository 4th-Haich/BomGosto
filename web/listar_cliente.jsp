<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Cliente> lista = new ArrayList<Cliente>();
    try {
        Cliente ct = new Cliente();
        lista = ct.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Clientes</title>              
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

        <script type="text/javascript">
            function excluir(id, nome) {
                var url = "gerenciar_cliente.do?op=excluir&id=" + id;
                if (confirm("Tem certeza que quer excluir o cliente: " + nome + "?")) {
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
                                    <h3 class="panel-title">Lista de Clientes</h3>                                    
                                </div>
                            </div>
                            <div>
                                <button type="button" class="btn btn-sm btn-primary btn-create" onclick="window.location.href = 'form_inserir_cliente.jsp'"><em class="glyphicon glyphicon-plus"></em> Novo</button>
                            </div>
                        </div>
                        <div class="panel-body table-responsive">
                            <table  id="results" class="table table-striped table-bordered table-list table-hover">
                                <thead>
                                    <tr>
                                        <th class="center">Nome</th>
                                        <th class="center">Telefone</th>
                                        <th class="center">CEP</th>
                                        <th class="center">Cidade</th>
                                        <th class="center">Endereço</th>
                                        <th class="center">Casa</th>
                                        <th class="center">Complemento</th>                                       
                                        <th class="center"><em class="fa fa-cog"></em> Opções</th>
                                    </tr> 
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th class="center">Nome</th>
                                        <th class="center">Telefone</th>
                                        <th class="center">CEP</th>
                                        <th class="center">Cidade</th>
                                        <th class="center">Endereço</th>
                                        <th class="center">Casa</th>
                                        <th class="center">Complemento</th>                                        
                                        <th class="center"><em class="fa fa-cog"></em> Opções</th>
                                    </tr> 
                                </tfoot>
                                <tbody>
                                    <% for (Cliente c : lista) {%>
                                    <tr>
                                        <td class="center"><%=c.getNome()%></td>
                                        <td class="center"><%=c.getTelefone()%></td>
                                        <td class="center"><%=c.getCep()%></td>
                                        <td class="center"><%=c.getCidade()%></td>
                                        <td class="center"><%=c.getEndereco()%></td>
                                        <td class="center"><%=c.getNumCasa()%></td>
                                        <td class="center"><%=c.getComplemento()%></td>                                        
                                        <td class="center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <em class="fa fa-cog"></em> Opções <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a href="form_alterar_cliente.jsp?id=<%=c.getId()%>"><em class="fa fa-pencil"></em> Alterar</a></li>
                                                    <li><a href="form_inserir_pedido.jsp?id=<%=c.getId()%>"><em class="glyphicon glyphicon-shopping-cart"></em> Fazer Pedido</a></li>
                                                    <%--<li><a href="" onclick="excluir(<%=c.getId()%>, '<%=c.getNome()%>')"><em class="glyphicon glyphicon-trash"></em> Excluir</a></li>--%>
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
        <script src="js/language.js"></script>                                              
    </body>
</html>

