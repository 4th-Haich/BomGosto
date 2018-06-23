<%@page import="model.Perfil"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    Cliente c = new Cliente();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente ct = new Cliente();
        c = ct.carregaPorId(id);

        Perfil pf = new Perfil();
        lista = pf.listar();
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
        <title>Alterar Cliente</title>              
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
        <!---//pop-up-box---->
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
                        <%@include file="navbar_u.jsp"%> 
                    </ul>
                </div>
            </div>
        </nav>
        <section class="box-content box-2 box-style">
            <div class="container">
                <form data-toggle="validator" class="form-horizontal " method="post" action="gerenciar_cliente.do" name="form_cliente" id="form_cliente">
                    <input type="hidden" name="op" value="alterar"/>
                    <input type="hidden" name="id" value="<%=c.getId()%>"/>                    
                    <fieldset>
                        <!-- Form Name -->
                        <legend>Alterar Cliente</legend>                        
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
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>                                   
                                    <input maxlength="45" class="form-control" name="nome" id="nome" type="text" value="<%=c.getNome()%>" required>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Telefone<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <input data-minlength="14" class="form-control sp_celphones" name="telefone" type="text" value="<%=c.getTelefone()%>" 
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
                                    <input data-minlength="9"  class="form-control cep" name="cep" id="cep" type="text" value="<%=c.getCep()%>"
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
                                    <input class="form-control" name="cidade" id="bairro" type="text" value="<%=c.getCidade()%>" required readonly>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Endereço<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                    <input class="form-control" name="endereco" id="rua" type="text" value="<%=c.getEndereco()%>" required readonly>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Número da Casa<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                                    <input maxlength="20" class="form-control" name="numcasa" type="text" id="numcasa" value="<%=c.getNumCasa()%>"
                                           data-error="Por favor, preencha este campo." required> 
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Complemento</label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-align-justify"></i></span>
                                    <input maxlength="45" class="form-control" name="complemento" type="text" id="complemento" value="<%=c.getComplemento()%>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">E-mail<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input maxlength="45" id="inputEmail" class="form-control" name="login" type="email" id="login" value="<%=c.getLogin()%>">
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Senha<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input maxlength="16" data-minlength="6" id="inputPassword" class="form-control" name="senha" type="password" id="password" value="<%=c.getSenha()%>" >                                                
                                </div>
                                <div class="help-block">Mínimo de 6 caracteres</div>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label class="col-md-4 control-label">Confirme a senha<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>                                                
                                    <input maxlength="16" id="inputPasswordConfirm" data-match="#inputPassword" class="form-control" type="password" placeholder="Confirme a senha">
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
                            <button class="btn btn-danger" onclick="window.location.href = 'listar_cliente.jsp'; return false;"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
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
        <script src="js/api-cep.js"></script>
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

