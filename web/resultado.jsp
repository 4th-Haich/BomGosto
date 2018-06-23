<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Recuperação de conta</title>        
        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/style_login.css">               
    </head>
    <body>
        <div class="form">
            <div class="tab-content">
                <h1><%=request.getAttribute("mensagem")%></h1>
                <a href="login.jsp"><button class="button button-block"/>Voltar</button></a>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/login.js"></script>                
    </body>    
</html>