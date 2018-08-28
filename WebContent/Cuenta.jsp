<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Beans.Login"%>
<%@page import="Beans.DetalleCuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoServiciosUsuario"%>
<%@page import="Constantes.Constantes"%>

<%
	DaoServiciosUsuario su = new DaoServiciosUsuario();
	Login login = (Login) session.getAttribute(Constantes.USUARIO);
	ArrayList<DetalleCuenta> bDetails = su.getBill(Integer.parseInt(login.getUsuario()));
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
            <% if(bDetails != null && !bDetails.isEmpty()) {%>			
            <table class="table table-striped">
            <%
            if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
            out.write("<tr><td> "
		+ Constantes.MENSAJE + " </td></tr>");
                Constantes.MENSAJE = "";
            }
            %>
            <tr>
		<th>NOMBRE DE LA ORDEN</th>
                <th>NOMBRE DEL PRODUCTO</th>
                <th>PRECIO PRODUCTO</th>
		<th>STOCK</th>
		<th>CANTIDAD ORDENADA</th>
		<th>TOTAL</th>
            </tr>
		<% double total = 0; %>
		<%for(int i=0; i < bDetails.size(); i++){
                    DetalleCuenta dc = bDetails.get(i);
		%>
            <tr>
		<td><%=dc.getOrderName() %></td>
		<td><%=dc.getItemName() %></td>
		<td><%=dc.getItemCost() %></td>
		<td><%=dc.getItemQnt() %></td>
		<td><%=dc.getOrderQnt() %></td>
		<td> <%=Double.parseDouble(dc.getItemCost()) * dc.getOrderQnt() %>
                    <% total = (Double.parseDouble(dc.getItemCost()) * dc.getOrderQnt()) + total; %>
		</td>
            </tr>
            <%}%>
            <tr>
                <td>SUMATORIA FINAL </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td> <%=total %></td>
            </tr>						
            </table>
         <%}%>
    </body>
</html>