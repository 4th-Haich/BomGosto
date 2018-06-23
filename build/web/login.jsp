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
                <li class="tab active"><a href="#login_cli">Cliente</a></li>
                <li class="tab"><a href="#login_fun">Usuário</a></li>
                <li><a href="registro.jsp">Cadastro</a></li>
                <li><a href="index.jsp">Home</a></li>
            </ul>
            <div class="tab-content">
                <div id="login_cli">   
                    <h1>Bem Vindo!</h1>
                    <form name="form_login_cli" action="valida_login.do" method="post">
                        <div class="field-wrap">
                            <label>
                                Usuário<span class="req">*</span>
                            </label>
                            <input type="email" name="login"  required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Senha<span class="req">*</span>
                            </label>
                            <input type="password" name="senha"  required autocomplete="off"/>
                        </div>
                        <p class="forgot"><a href="recuperacao.jsp">Esqueci minha senha</a></p>
                        <button class="button button-block">Entrar</button>
                    </form>
                </div>

                <div id="login_fun">   
                    <h1>Bem Vindo!</h1>
                    <form name="form_login_fun" action="valida_login.do" method="post">
                        <div class="field-wrap">
                            <label>
                                Usuário<span class="req">*</span>
                            </label>
                            <input type="text" name="login" class="cpf"  required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Senha<span class="req">*</span>
                            </label>
                            <input type="password" name="senha"  required autocomplete="off"/>
                        </div>                        
                        <button class="button button-block">Entrar</button>
                    </form>
                </div>               
            </div>
        </div> <!-- /form -->
        <script src="js/jquery.min.js"></script>
        <script src="js/login.js"></script>
        <script src="js/api-cep.js"></script>
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('.cpf').mask('000.000.000-00', {reverse: true});
            });
        </script>
    </body>
</html>
