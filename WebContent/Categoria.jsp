<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Dao.DaoServiciosUsuario"%>
<%@page import="Beans.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Constantes.Constantes"%>

<%
    ArrayList<Categoria> c = new DaoServiciosUsuario().getAllCategorys();
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
        <form action="cook?action=addCategory" method="post">
            <table class="table table-striped">
                <%
                    if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
                        out.write("<tr><td> "
                        + Constantes.MENSAJE + "</td></tr>");
                        Constantes.MENSAJE = "";
                    }
                %>
                <tr>
                    <th>ID CATEGORIA</th>
                    <th>NOMBRE CATEGORIA</th>
                </tr>
                <% if(c != null && c.size() != 0) {
                    for(int i=0; i< c.size();i++){
                    Categoria ca = c.get(i);
                %>
                <tr>
                    <td><%= i+1  %></td>
                    <td><a href="Productos.jsp?catId=<%=ca.getIdCategoria()%>"><%= ca.getNombreCategoria() %></a>
                </td>
                </tr>
                    <%}} %>
            </table>
        </form>
    </body>
</html>