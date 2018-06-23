<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Menu> lista = new ArrayList<Menu>();
    try {
        Menu mn = new Menu();
        lista = mn.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }

%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Language" content="pt-br" />
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Restaurante" />
        <meta name="author" content="FPDCVA" />
        <title>Bom Gosto</title>


        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/contact-buttons.css" rel="stylesheet">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>

        <!---pop-up-box---->
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
        <style>

            .bg_video{
                position: fixed; 
                right: 0; 
                bottom: 0;
                min-width: 100%; 
                min-height: 100%;
                top:5%;
                width: auto; 
                height: auto; 
                z-index: -1000;
                background: url(http://i2.kym-cdn.com/photos/images/newsfeed/001/042/619/4ea.jpg) no-repeat;
                background-size: cover; 
            }
            .body{
                margin: 20% auto 20px auto;
                max-width: 15%;
            }
            h1 {
                font-size: 100px;
                color: #FFFFFF;
                text-align: center;
                text-shadow: 0 0 3px #000000;
            }
            p {
                font-size: 30px;
                color: #FFFFFF;
                text-align: center;
                text-shadow: 0 0 3px #000000;
            }
        </style>
    </head>
    <body style="background-color: blue">
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
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="login.jsp">Entrar</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="body">
            <video class="bg_video">
            </video>
            <p>Erro:</p>
            <h1>500</h1>
            <p>Erro Interno do Servidor</p>
        </div>


        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
        <!-- Bootstrap Core JavaScript -->
    </body>
</html>

