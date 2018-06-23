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

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/style_login.css">
        <script src="js/jquery.min.js"></script>

        <style>
            body {
                background: #1a1a1a;
                color: white;
                font-family: 'Roboto';
            }
            .flat-form {
                background: #e74c3c;
                margin: 25px auto;
                width: 390px;
                height: 340px;
                position: relative;
                font-family: 'Roboto';
            }
            .tabs {
                background: #c0392b;
                height: 40px;
                margin: 0;
                padding: 0;
                list-style-type: none;
                width: 100%;
                position: relative;
                display: block;
                margin-bottom: 20px;
            }
            .tabs li {
                display: block;
                float: left;
                margin: 0;
                padding: 0;
            }
            .tabs a {
                background: #c0392b;
                display: block;
                float: left;
                text-decoration: none;
                color: white;
                font-size: 16px;
                padding: 12px 22px 12px 22px;
                /*border-right: 1px solid @tab-border;*/

            }
            .tabs li:last-child a {
                border-right: none;
                width: 174px;
                padding-left: 0;
                padding-right: 0;
                text-align: center;
            }
            .tabs a.active {
                background: #e74c3c;
                border-right: none;
                -webkit-transition: all 0.5s linear;
                -moz-transition: all 0.5s linear;
                transition: all 0.5s linear;
            }
            .form-action {
                padding: 0 20px;
                position: relative;
            }

            .form-action h1 {
                font-size: 42px;
                padding-bottom: 10px;
            }
            .form-action p {
                font-size: 12px;
                padding-bottom: 10px;
                line-height: 25px;
            }
            form {
                padding-right: 20px !important;
            }
            form input[type=text],
            form input[type=password],
            form input[type=submit] {
                font-family: 'Roboto';
            }

            form input[type=text],
            form input[type=password] {
                width: 100%;
                height: 40px;
                margin-bottom: 10px;
                padding-left: 15px;
                background: #fff;
                border: none;
                color: #e74c3c;
                outline: none;
            }

            .dark-box {
                background: #5e0400;
                box-shadow: 1px 3px 3px #3d0100 inset;
                height: 40px;
                width: 50px;
            }
            .form-action .dark-box.bottom {
                position: absolute;
                right: 0;
                bottom: -24px;
            }
            .tabs + .dark-box.top {
                position: absolute;
                right: 0;
                top: 0px;
            }
            .show {
                display: block;
            }
            .hide {
                display: none;
            }

            .button {
                border: none;
                display: block;
                background: #136899;
                height: 40px;
                width: 80px;
                color: #ffffff;
                text-align: center;
                border-radius: 5px;
                /*box-shadow: 0px 3px 1px #2075aa;*/
                -webkit-transition: all 0.15s linear;
                -moz-transition: all 0.15s linear;
                transition: all 0.15s linear;
            }

            .button:hover {
                background: #1e75aa;
                /*box-shadow: 0 3px 1px #237bb2;*/
            }

            .button:active {
                background: #136899;
                /*box-shadow: 0 3px 1px #0f608c;*/
            }

            ::-webkit-input-placeholder {
                color: #e74c3c;
            }
            :-moz-placeholder {
                /* Firefox 18- */
                color: #e74c3c;
            }
            ::-moz-placeholder {
                /* Firefox 19+ */
                

            </style>  


        </head>

        <body>
            <div class="container">
                <div class="flat-form">
                    <ul class="tabs">
                        <li>
                            <a href="#login" class="active">Login</a>
                        </li>
                        <li>
                            <a href="#register">Register</a>
                        </li>
                        <li>
                            <a href="#reset">Reset Password</a>
                        </li>
                    </ul>
                    <div id="login" class="form-action show">
                        <h1>Bem Vindo!</h1>
                        <form name="form_login_cli" action="valida_login.do" method="post">
                            <div class="field-wrap">
                                <label>
                                    Usuário<span class="req">*</span>
                                </label>
                                <input type="email" name="email" required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Senha<span class="req">*</span>
                                </label>
                                <input type="password" name="senha" required autocomplete="off"/>
                            </div>
                            <p class="forgot"><a href="recuperacao.jsp">Esqueci minha senha</a></p>
                            <button class="button button-block">Entrar</button>
                        </form>
                    </div>
                    <!--/#login.form-action-->
                    <div id="register" class="form-action hide">
                        <h1>Bem Vindo!</h1>
                        <form name="form_login_fun" action="valida_login.do" method="post">
                            <div class="field-wrap">
                                <label>
                                    Usuário<span class="req">*</span>
                                </label>
                                <input type="text" name="cpf" class="cpf" required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Senha<span class="req">*</span>
                                </label>
                                <input type="password" name="senha" required autocomplete="off"/>
                            </div>
                            <p class="forgot"><a href="recuperacao.jsp">Esqueci minha senha</a></p>
                            <button class="button button-block">Entrar</button>
                        </form>
                    </div>
                    <!--/#register.form-action-->
                    <div id="reset" class="form-action hide">
                        <h1>Cadastro</h1>
                        <form action="gerenciar_cliente.do" method="post">
                            <input type="hidden" name="op" value="inserir"/>                         
                            <div class="field-wrap">
                                <label>
                                    Nome<span class="req">*</span>
                                </label>
                                <input type="text" name="nome" required autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Telefone<span class="req">*</span>
                                </label>
                                <input type="text" required name="telefone" class="sp_celphones" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Cep<span class="req">*</span>
                                </label>
                                <input type="text" required name="cep" class="cep"  value="" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Cidade<span class="req">*</span>
                                </label>
                                <input type="text" required name="cidade" id="bairro" value="" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Endereço<span class="req">*</span>
                                </label>
                                <input type="text" required name="endereco" id="rua" value="" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Número<span class="req">*</span>
                                </label>
                                <input type="text" required name="numcasa" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Complemento
                                </label>
                                <input type="text" name="complemento" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    E-mail<span class="req">*</span>
                                </label>
                                <input type="email" required name="login" autocomplete="off"/>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Senha<span class="req">*</span>
                                </label>
                                <input type="password" required name="senha" autocomplete="off"/>
                            </div>
                            <button type="submit" class="button button-block">Cadastrar</button>
                        </form>  
                    </div>
                    <!--/#register.form-action-->
                </div>
            </div>
            <script>
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
                (function ($) {
                    // constants
                    var SHOW_CLASS = 'show',
                            HIDE_CLASS = 'hide',
                            ACTIVE_CLASS = 'active';

                    $('.tab').on('click', 'li a', function (e) {
                        e.preventDefault();
                        var $tab = $(this),
                                href = $tab.attr('href');

                        $('.active').removeClass(ACTIVE_CLASS);
                        $tab.addClass(ACTIVE_CLASS);

                        $('.show')
                                .removeClass(SHOW_CLASS)
                                .addClass(HIDE_CLASS)
                                .hide();

                        $(href)
                                .removeClass(HIDE_CLASS)
                                .addClass(SHOW_CLASS)
                                .hide()
                                .fadeIn(550);
                    });
                })(jQuery);
            </script>
            <script src="js/jquery.min.js"></script>

        </body>
    </html>
