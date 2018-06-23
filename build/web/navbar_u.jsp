<%@page import="model.Menu"%>
<%@page import="model.Usuario"%>
<%
    Usuario uLogado = new Usuario();
    try {
        uLogado = (Usuario) session.getAttribute("usuario");
        if (uLogado.getId() != 0) { 
            for (Menu mLogado : uLogado.getPerfil().getListaMenu()) {
%>
<li><a href="<%=mLogado.getLink()%>"> <span class="glyphicon glyphicon-<%=mLogado.getIcone()%>"></span> <%=mLogado.getTitulo()%></a></li>
    <%
        }
    %>
<li><a href="form_alterar_usuario.jsp?id=<%=uLogado.getId()%>"><span class="glyphicon glyphicon-wrench"></span> <%out.print(uLogado.getNome());%></a></li><li><a  href="sair.jsp" ><span class="glyphicon glyphicon-log-out"></span> Sair </a></li>       
    <%
            }

        } catch (Exception e) {
            out.print("Acesso Negado");
            response.sendRedirect("login.jsp");
        }
    %>

