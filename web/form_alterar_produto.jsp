<%@page import="model.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Categoria> lista = new ArrayList<Categoria>();
    Produto p = new Produto();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto pd = new Produto();
        p = pd.carregaPorId(id);

        Categoria cat = new Categoria();
        lista = cat.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head><meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>              
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Bom Gosto" />
        <meta name="author" content="Parceria" />

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/validator.min.js"></script> 
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
                <form data-toggle="validator" class="form-horizontal " method="post" action="gerenciar_produto.do" name="form_produto" id="form_produto">
                    <input type="hidden" name="op" value="alterar"/>
                    <input type="hidden" name="id" value="<%=p.getId()%>"/>
                    <fieldset>
                        <!-- Form Name -->
                        <legend>Alterar Produto</legend>                        
                        <!-- Prepended text-->
                        <div class="form-group">
                            <label class="col-md-4 control-label">Código</label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>                                   
                                    <input class="form-control" type="text" value="<%=p.getId()%>" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Nome<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-header"></i></span>                                   
                                    <input maxlength="40" class="form-control" name="nome" id="nome" type="text" value="<%=p.getNome()%>" required>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>                        
                        <div class="form-group">
                            <label class="col-md-4 control-label">Preço Unitário<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                    <input maxlength="8" class="form-control money" name="precoUnitario" id="precoUnitario" type="text"  value="<%=p.getPrecoUnitario()%>" required>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Imagem<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
                                    <input maxlength="50" class="form-control" name="imagem" id="imagem" type="text"  value="<%=p.getImagem()%>" required>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>        
                        <div class="form-group"> 
                            <label class="col-md-4 control-label">Categoria<span class="req">*</span></label>
                            <div class="col-md-4 selectContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-header"></i></span>
                                    <select name="categoria_id" id="categoria_id" class="form-control selectpicker" required>
                                        <option  value="">Selecione...</option>
                                        <% for (Categoria c : lista) {
                                                String selecao = "";
                                                if (c.getId() == p.getCategoria().getId()) {
                                                    selecao = "selected";
                                                }
                                        %>
                                        <option value="<%=c.getId()%>" <%=selecao%>><%=c.getNome()%></option>
                                        <% }%>                                       
                                    </select>
                                </div>
                                    <div class="help-block with-errors"></div>
                            </div>
                        </div>                                                    
                    </fieldset>               
                    <!-- Button (Double) -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-8">
                            <button class="btn btn-success" type="submit" onclick="return validar()"><span class="glyphicon glyphicon-ok"></span> Salvar</button>
                            <button class="btn btn-danger" onclick="window.location.href = 'listar_produto.jsp';return false;"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
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
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>
        <script>
                                $(function () {
                                    $('.money').mask('#0.00', {reverse: true});
                                });
        </script>
    </body>
</html>

