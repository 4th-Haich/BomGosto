
<%@page import="model.Cliente"%>
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
        <title>Dados do Cliente</title>


        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="css/data/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">

        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/contact-buttons.css" rel="stylesheet">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>        
        <script src="js/validator.min.js"></script>
    </head>
    <body>	
        <%
            Cliente uLogadoCL = new Cliente();
            uLogadoCL = (Cliente) session.getAttribute("usuario");
        %>
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
                    <a class="navbar-brand" href="index.jsp">
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
                                    <h3 class="panel-title center">Dados Pessoais</h3>                                    
                                </div>
                            </div>
                        </div>
                        <div class="panel-body table-responsive">
                            <form data-toggle="validator" class="form-horizontal " method="get" action="gerenciar_cliente.do" name="form_cliente" id="form_cliente">
                                <input type="hidden" name="op" value="alterar"/>
                                <input type="hidden" name="id" value="<%=uLogadoCL.getId()%>"/>
                                <%uLogadoCL.carregaPorId(uLogadoCL.getId());%>
                                <fieldset>          
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Nome<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>                                                
                                                <input maxlength="45" class="form-control" id="nome" name='nome' type="text" value="<%=uLogadoCL.getNome()%>" autocomplete="off" required> 
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Telefone<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input data-minlength="14" class="form-control sp_celphones" id="telefone" name="telefone" type="text" value="<%=uLogadoCL.getTelefone()%>"
                                           data-error="Por favor, preencha este campo." required>                                   
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Cep<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                <input data-minlength="9" class="form-control cep" name="cep" id="cep" type="text" value="<%=uLogadoCL.getCep()%>" 
                                           data-error="Por favor, preencha este campo." required>                                   
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Cidade<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                <input class="form-control" name="cidade" id="bairro" type="text" value="<%=uLogadoCL.getCidade()%>" required readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Endereço<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                <input class="form-control" name="endereco" id="rua" type="text" value="<%=uLogadoCL.getEndereco()%>" required readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Número da Casa<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                                <input maxlength="45" class="form-control" name="numcasa" id="numcasa" type="text" value="<%=uLogadoCL.getNumCasa()%>" required>
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Complemento</label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-align-justify"></i></span>
                                                <input maxlength="45" class="form-control" name="complemento" id="complemento" type="text" value="<%=uLogadoCL.getComplemento()%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">E-mail<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                <input maxlength="45" id="inputEmail" class="form-control" name="login" type="email"  value="<%=uLogadoCL.getLogin()%>" required readonly>
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Senha<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                <input maxlength="16" data-minlength="6" id="inputPassword" class="form-control" name="senha" type="password" value="<%=uLogadoCL.getSenha()%>" required>                                                
                                            </div>
                                            <div class="help-block">Mínimo de 6 caracteres</div>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Confirme a Senha<span class="req">*</span></label>  
                                        <div class="col-md-4 inputGroupContainer">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>                                                
                                                <input maxlength="16" data-match="#inputPassword" id="inputPasswordConfirm"  class="form-control" type="password" placeholder="Confirme a senha" required>
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div> 
                                </fieldset>
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div class="col-md-8">
                                        <button class="btn btn-success pure-button pure-button-primary" type="submit"><span class="glyphicon glyphicon-ok"></span> Salvar</button>
                                        <button class="btn btn-danger" onclick="javascript:history.back();return false;"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                                    </div>
                                </div>
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
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/data/jquery.js"></script>
        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/data/jquery.dataTables.min.js"></script>   
        <script src="js/data/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>

        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>   
        <script src="js/api-cep.js "></script>   
        <script src="js/language.js"></script>
        <script type="text/javascript">
                                            $(function () {

                                                $('.cep').mask('00000-000');
                                                var SPMaskBehavior = function (val) {
                                                    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
                                                },
                                                        spOptions = {
                                                            onKeyPress: function (val, e, field, options) {
                                                                field.mask(SPMaskBehavior.apply({}, arguments), options);
                                                            }
                                                        };

                                                $('.sp_celphones').mask(SPMaskBehavior, spOptions);

                                            });
        </script>
    </body>
</html>