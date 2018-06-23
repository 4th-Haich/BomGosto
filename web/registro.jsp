<%@page import="model.Usuario"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Entrar</title>        
        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/style_login.css">        
        <%
            Usuario uLogado = new Usuario();
            Cliente uLogadoC = new Cliente();
            try {
                try {
                    uLogado = (Usuario) session.getAttribute("usuario");
                    out.print(uLogado.getNome());
                } catch (Exception e) {
                    //out.print("erro: " + e);
                }
                try {
                    uLogadoC = (Cliente) session.getAttribute("usuario");
                    out.print(uLogadoC.getNome());
                } catch (Exception e) {
                    //out.print("erro: " + e);
                }
                if (uLogado.getId() != 0) {
                    switch (uLogado.getPerfil().getId()) {
                        case 1: {
                            response.sendRedirect("area_admin.jsp");
                        }
                        break;
                        case 2: {
                            response.sendRedirect("area_admin.jsp");
                        }
                        break;
                        case 3: {
                            response.sendRedirect("listar_pedido.jsp");
                        }
                        break;
                        default: {

                        }
                        break;
                    }
                } else if (uLogadoC.getId() != 0) {
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                //out.print("erro: " + e);
                //out.print("<script> alert ('Usuário deslogado do sistema')</script>");
            }
        %>
    </head>

    <body>
        <div class="form">
            <ul class="tab-group">
                <li class="tab active"><a href="#signup">Cadastro</a></li>
                <li> <a href="login.jsp">Voltar</a></li>
            </ul>
            <div class="tab-content">
                <div id="signup">   
                    <h1>Cadastro</h1>
                    <form action="gerenciar_cliente.do" method="post">
                        <input type="hidden" name="op" value="inserir"/>                         
                        <div class="field-wrap">
                            <label>
                                Nome<span class="req">*</span>
                            </label>
                            <input maxlength="45" type="text" name="nome"  required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Telefone<span class="req">*</span>
                            </label>
                            <input data-minlength="14" type="text" required name="telefone"  class="sp_celphones" autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Cep<span class="req">*</span>
                            </label>
                            <input data-minlength="9" type="text" required name="cep" class="cep" id="cep"  value="" autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Cidade<span class="req">*</span>
                            </label>
                            <input type="text" required name="cidade" id="bairro"  value="" autocomplete="off" readonly/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Endereço<span class="req">*</span>
                            </label>
                            <input type="text" required name="endereco" id="rua" value=""  autocomplete="off" readonly/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Número<span class="req">*</span>
                            </label>
                            <input maxlength="20" type="text"  required name="numcasa" autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Complemento
                            </label>
                            <input maxlength="45" type="text" name="complemento"  autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label >
                                E-mail<span class="req">*</span>
                            </label>
                            <input maxlength="45" type="email" required name="login"  autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Senha<span class="req">*</span>
                            </label>
                            <input maxlength="16" type="password" required name="senha" value="" autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Confirme a senha<span class="req">*</span>
                            </label>
                            <input maxlength="16" type="password" required  id="confirm_password"  autocomplete="off"/>
                        </div>
                        <button type="submit" class="button button-block">Cadastrar</button>
                    </form>                    
                </div>
                <div id="login_cli">                      
                </div>
            </div>
        </div> <!-- /form -->
        <script src="js/jquery.min.js"></script>
        <script src="js/login.js"></script>
        <script src="js/api-cep.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>       
        <script type="text/javascript">
            $(function () {
                $('.date').mask('00/00/0000');
                $('.time').mask('00:00:00');
                $('.date_time').mask('00/00/0000 00:00:00');
                $('.cep').mask('00000-000');
                $('.phone').mask('0000-0000');
                $('.phone_with_ddd').mask('(00) 0000-0000');
                $('.phone_us').mask('(000) 000-0000');
                $('.mixed').mask('AAA 000-S0S');
                $('.ip_address').mask('099.099.099.099');
                $('.percent').mask('##0,00%', {reverse: true});
                $('.clear-if-not-match').mask("00/00/0000", {clearIfNotMatch: true});
                $('.placeholder').mask("00/00/0000", {placeholder: "__/__/____"});
                $('.fallback').mask("00r00r0000", {
                    translation: {
                        'r': {
                            pattern: /[\/]/,
                            fallback: '/'
                        },
                        placeholder: "__/__/____"
                    }
                });

                $('.selectonfocus').mask("00/00/0000", {selectOnFocus: true});

                $('.cep_with_callback').mask('00000-000', {onComplete: function (cep) {
                        console.log('Mask is done!:', cep);
                    },
                    onKeyPress: function (cep, event, currentField, options) {
                        console.log('An key was pressed!:', cep, ' event: ', event, 'currentField: ', currentField.attr('class'), ' options: ', options);
                    },
                    onInvalid: function (val, e, field, invalid, options) {
                        var error = invalid[0];
                        console.log("Digit: ", error.v, " is invalid for the position: ", error.p, ". We expect something like: ", error.e);
                    }
                });

                $('.crazy_cep').mask('00000-000', {onKeyPress: function (cep, e, field, options) {
                        var masks = ['00000-000', '0-00-00-00'];
                        mask = (cep.length > 7) ? masks[1] : masks[0];
                        $('.crazy_cep').mask(mask, options);
                    }});

                $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
                $('.cpf').mask('000.000.000-00', {reverse: true});
                $('.money').mask('#.##0,00', {reverse: true});

                var SPMaskBehavior = function (val) {
                    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
                },
                        spOptions = {
                            onKeyPress: function (val, e, field, options) {
                                field.mask(SPMaskBehavior.apply({}, arguments), options);
                            }
                        };

                $('.sp_celphones').mask(SPMaskBehavior, spOptions);

                $(".bt-mask-it").click(function () {
                    $(".mask-on-div").mask("000.000.000-00");
                    $(".mask-on-div").fadeOut(500).fadeIn(500)
                })

                $('pre').each(function (i, e) {
                    hljs.highlightBlock(e)
                });
            });
        </script>
    </body>
</html>
