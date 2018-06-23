<%@page import="model.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%
    Categoria c = new Categoria();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Categoria cat = new Categoria();
        c = cat.carregaPorId(id);
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
        <title>Alterar Categoria</title>              
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
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <script src="js/validator.min.js"></script> 
        <!---//pop-up-box---->
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
                <form data-toggle="validator" class="form-horizontal " method="post" action="gerenciar_categoria.do" name="form_categoria" id="form_categoria">
                    <input type="hidden" name="op" value="alterar"/>
                    <input type="hidden" name="id" value="<%=c.getId()%>"/>
                    <fieldset>
                        <!-- Form Name -->
                        <legend>Alterar Categoria</legend>                        
                        <!-- Prepended text-->
                        <div class="form-group">
                            <label class="col-md-4 control-label">Código</label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>                                   
                                    <input class="form-control" type="text" value="<%=c.getId()%>" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Nome<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-header"></i></span>                                   
                                    <input maxlength="45" class="form-control" id="nome" name="nome" type="text" value="<%=c.getNome()%>" 
                                           data-error="Por favor, preencha este campo." required> 
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>                              
                    </fieldset>                
                    <!-- Button (Double) -->
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-8">
                            <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-ok"></span> Salvar</button>
                            <button class="btn btn-danger" onclick="window.location.href = 'listar_categoria.jsp'; return false;"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
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
    </body>
</html>

