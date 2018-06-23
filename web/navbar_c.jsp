<%@page import="model.Cliente"%>
<%
    Cliente uLogadoC = new Cliente();
%>

<li>
    <a class="page-scroll" href="index.jsp#intro">Home</a>
</li>
<li>
    <a class="page-scroll" href="index.jsp#menu">Menu</a>
</li>
<li>
    <a class="page-scroll" href="cardapio.jsp">Cardapio</a>
</li>
<li>
    <a class="page-scroll" href="index.jsp#contact">Contato</a>
</li>

<%
    try {
        uLogadoC = (Cliente) session.getAttribute("usuario");
        out.print("<li>");
        out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'><span class='glyphicon glyphicon-user'></span> " + uLogadoC.getNome() + "");
        out.print("<span class='caret'></span></a>");
        out.print("<ul class='dropdown-menu'>");
        out.print("<li><a href='pedidos.jsp'>Meus Pedidos</a></li>");
        out.print("<li><a href='dados_cliente.jsp'>Meus Dados</a></li>");
        out.print("<li><a href='checkout.jsp'>Carrinho</a></li>");
        out.print("</ul>");
        out.print("</li>");
        out.print("<li>");
        out.print("<a  href='sair.jsp' ><span class='glyphicon glyphicon-log-out'></span> Sair </a>");
        out.print("</li>");
    } catch (Exception e) {
%>
<li>
    <a href="login.jsp">Entrar</a>
</li>
<%
    }
%>



