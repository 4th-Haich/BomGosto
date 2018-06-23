<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>

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
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!---//pop-up-box---->

        <script>
            $(document).ready(function () {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

            });
        </script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="js/html5shiv.js"></script>
            <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>	

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

        <header id="intro">
            <!-- Carousel -->
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel" data-slide-to="1"></li>
                    <li data-target="#carousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/1.jpg" alt="First slide">
                        <!-- Static Header -->
                        <div class="header-text hidden-xs">
                            <div class="col-md-12 text-center">                                                                
                                <h3>Bem-Vindo ao Restaurante e Pizzaria Bom Gosto.</h3>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/2.jpg" alt="Second slide">
                        <!-- Static Header -->
                        <div class="header-text hidden-xs">
                            <div class="col-md-12 text-center">                                                                
                                <h3>Bem-Vindo ao Restaurante e Pizzaria Bom Gosto.</h3>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/3.jpg" alt="Third slide">
                        <!-- Static Header -->
                        <div class="header-text hidden-xs">
                            <div class="col-md-12 text-center">                                                                
                                <h3>Bem-Vindo ao Restaurante e Pizzaria Bom Gosto.</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div><!-- /carousel -->
        </header>
        <!-- Header -->

        <a id='backTop'>Back To Top</a>
        <!-- /Back To Top -->

        <!-- /////////////////////////////////////////Content -->
        <div id="page-content" class="index-page">
            <!-- ////////////Content Box 01 -->
            <div id="services"></div>
            <section class="box-content box-1">
                <div class="container">
                    <div class="row"> 
                        <div class="col-sm-2 ">
                        </div>
                        <div class="col-sm-4 ">
                            <div class="service">
                                <a class="page-scroll" href="#mapa"><img src="images/icon3.png" title="icon-name"></a>
                                <h3>Mapa</h3>
                                <p>Bem perto da sua casa. </p>
                                <a class="btn btn-2 btn-sm page-scroll" href="#mapa">Saiba Mais</a>
                            </div>
                        </div>
                        <div class="col-sm-4 ">
                            <div class="service">
                                <a href="#menu"><img src="images/icon2.png" title="icon-name"></a>
                                <h3>Cardápio</h3>
                                <p>As melhores pizzas da região. </p>
                                <a class="btn btn-2 btn-sm" href="#menu">Saiba Mais</a>
                            </div>
                        </div>                        
                        </div>
                    </div>
                </div>
            </section>

            <!-- ////////////Content Box 02 -->
            <section class="box-content box-2 box-style" id="menu">
                <div class="container">
                    <div class="row heading">
                        <div class="col-lg-12">	
                            <h2>Menu</h2>
                            <div class="intro">A Melhor Picanha da Cidade</div>
                                <div> Além de nossas tradicionais pizzas, você poderá saborear os melhores grelhados da cidade, servidos nas opções À La Carte ou Petiscos. Venha experimentar!</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="box-item">
                                <div class="col-sm-6">
                                    <div class="media"><img class="media__image " src="images/produtos/pizza-calabresa.jpg">
                                        <div class="media__body">
                                            <h2>R$ 15.99</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="wrapper">
                                        <h3>Pizza de Calabresa</h3>
                                        <p>Tamanho: Médio</p>
                                        <a class="btn btn-3" href="cardapio.jsp">Saiba Mais</a>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="box-item">
                                <div class="col-sm-6">
                                    <div class="media"><img class="media__image " src="images/produtos/pizza-mussarela.jpg">
                                        <div class="media__body">
                                            <h2>R$ 12.69</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="wrapper">
                                        <h3>Pizza de Mussarela</h3>
                                        <p>Tamanho: Médio</p>
                                        <a class="btn btn-3" href="cardapio.jsp">Saiba Mais</a>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="box-item">
                                <div class="col-sm-6">
                                    <div class="media"><img class="media__image " src="images/produtos/pizza-moda-da-casa.jpg">
                                        <div class="media__body">
                                            <h2>R$16.99</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="wrapper">
                                        <h3>Pizza a Moda da Casa</h3>
                                        <p>Tamanho: Médio</p>
                                        <a class="btn btn-3" href="#">Read More</a>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="box-item">
                                <div class="col-sm-6">
                                    <div class="media"><img class="media__image " src="images/produtos/suco-de-cupuacu.jpg">
                                        <div class="media__body">
                                            <h2>R$ 3.59</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="wrapper">
                                        <h3>Suco de Cupuaçu</h3>
                                        <a class="btn btn-3" href="#">Read More</a>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <section class="box-content box-5" id="contact">
                <div class="container">
                    <div class="row heading">
                        <div class="col-lg-12">	
                            <h2>Contato</h2>                           
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 box-item">
                            <div class="row">
                                <h3>Envie-nos uma sugestão</h3>
                                <p>Deixe sua sugestão para que possamos melhorar cada vez mais.</p>
                                <h3>Ou ligue</h3>
                                <p>(61) 3379-4008<br></p>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <form name="form1" method="post" action="mailto:turmaquatrod@gmail.com">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control input-lg" name="name" id="name" placeholder="Nome" required="required" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control input-lg" name="email" id="email" placeholder="E-mail" required="required" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control input-lg" name="subject" id="subject" placeholder="Assunto" required="required" />
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea name="body" id="message" class="form-control" rows="4" cols="25" required="required"
                                                      placeholder="Mensagem"></textarea>
                                        </div>						
                                        <button type="submit" class="btn btn-4 btn-block" id="btnBbooking">Enviar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <section class="box-content box-2 box-style" id="mapa">
                <div class="container">
                    <div class="row heading">
                        <div class="col-lg-12">	
                            <h2>Mapa</h2>                            
                        </div>
                    </div>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d479.908740290111!2d-48.1235764!3d-15.7897151!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xac5fb76165422b3e!2sPizzaria+Bom+Gosto!5e0!3m2!1spt-BR!2sbr!4v1497819682275" width="100%" height="450px" frameborder="0" style="border:0" allowfullscreen></iframe>                    
                </div>
            </section>>
        </div>
        <div class="coppy-right">
            <div class="wrap-footer">
                <div class="clearfix">
                    <div class="col-md-6 col-md-offset-3">
                        <%@include file="copyright.jsp" %> 
                    </div>
                </div>	
            </div>
        </div>
        <!-- Footer -->

        <!-- Core JavaScript Files -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backTop.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#backTop').backTop({
                    'position': 1200,
                    'speed': 500,
                    'color': 'red'
                });
            });
        </script>   
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
        <!-- Bootstrap Core JavaScript -->
    </body>
</html>