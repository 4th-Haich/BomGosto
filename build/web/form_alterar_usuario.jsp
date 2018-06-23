<%@page import="model.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Perfil> lista = new ArrayList<Perfil>();
    Usuario u = new Usuario();
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Usuario us = new Usuario();
        u = us.carregaPorId(id);

        Perfil pf = new Perfil();
        lista = pf.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
    Usuario uLogadoV = new Usuario();
    try {
        uLogadoV = (Usuario) session.getAttribute("usuario");
        if (u.getPerfil().getId() < uLogadoV.getPerfil().getId()) {
            out.print("Acesso Negado");
            response.sendRedirect("listar_usuario.jsp");
        }
    } catch (Exception e) {
        out.print("Acesso Negado");
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Usuário</title>              
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
                <form data-toggle="validator" class="form-horizontal " method="post" action="gerenciar_usuario.do" name="form_usuario" id="form_usuario">
                    <input type="hidden" name="op" value="alterar"/>
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <fieldset>
                        <!-- Form Name -->
                        <legend>Alterar Usuário</legend>                        
                        <!-- Prepended text-->
                        <div class="form-group">
                            <label class="col-md-4 control-label">Código</label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>                                   
                                    <input class="form-control" type="text" value="<%=u.getId()%>" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Nome<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>                                   
                                    <input maxlength="45" class="form-control" name="nome" id="nome" type="text" value="<%=u.getNome()%>" required>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Telefone<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <input data-minlength="14" class="form-control sp_celphones" name="telefone" type="text" id="telefone" value="<%=u.getTelefone()%>"
                                           data-error="Por favor, preencha este campo." required>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">CPF<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input data-minlength="14" class="form-control cpf" name="login" type="text" id="cpf" value="<%=u.getCpf()%>"
                                           data-error="Por favor, preencha este campo." required readonly>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>  
                        <div class="form-group"> 
                            <label class="col-md-4 control-label">Perfil<span class="req">*</span></label>
                            <div class="col-md-4 selectContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-duplicate"></i></span>
                                    <select name="perfil_id" id="perfil_id" class="form-control selectpicker" required>
                                        <option  value="">Selecione...</option>
                                        <% for (Perfil p : lista) {
                                                String selecao = "";
                                                if (p.getId() >= uLogado.getPerfil().getId()) {
                                                    if (p.getId() == u.getPerfil().getId()) {
                                                        selecao = "selected";
                                                    }
                                        %>
                                        <option value="<%=p.getId()%>" <%=selecao%>><%=p.getNome()%></option>
                                        <%
                                                }
                                            }
                                        %>                                       
                                    </select>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Senha<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input maxlength="16" data-minlength="6" id="inputPassword" class="form-control" name="senha" type="password" id="senha" value="<%=u.getSenha()%>" required>                                                
                                </div>
                                <div class="help-block with-errors">Mínimo de 6 caracteres</div>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-md-4 control-label">Confirme a Senha<span class="req">*</span></label>  
                            <div class="col-md-4 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>                                                
                                    <input  maxlength="16" data-minlength="6" id="inputPasswordConfirm" data-match="#inputPassword"class="form-control" type="password" placeholder="Confirme a senha" required>
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
                            <button class="btn btn-danger" onclick="window.location.href = 'listar_usuario.jsp';return false;"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
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
        <script type="text/javascript">
                                $(function () {
                                    $('.cpf').mask('000.000.000-00', {reverse: true});
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
