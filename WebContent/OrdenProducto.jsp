<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Beans.DetalleOrden"%>
<%@page import="Dao.Constantes"%>
<%@page import="Beans.Orden.EstadoOrden"%>
<%@page import="Beans.Orden.EstadoOrden"%>
<%@page import="Beans.Orden"%>
<%@page import="Dao.DaoServicioCocina"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<DetalleOrden> orders = null;
	if(request.getParameter("orderId") != null )
	orders = new DaoServicioCocina().getAllItems(Integer.parseInt(request.getParameter("orderId")));
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
            <table class="table table-striped">
		<%
                    if (!Constantes.MENSAJE.equals("")
                    && Constantes.MENSAJE != null) {
                        out.write("<tr><td> "
			+ Constantes.MENSAJE + " </td></tr>");
			Constantes.MENSAJE = "";
								}
		%>
                    <% if(orders.size() != 0 && orders != null) {%>
		<tr>
                    <th>Sr No</th>
                    <th>NROº MESA</th>
                    <th>ID ORDEN</th>
                    <th>NOMBRE PRODUCTO</th>  
                    <th>CANTIDAD</th>
                    <th>ESTADO ACTUAL</th>
                    <th>CAMBIAR ESTADO</th>
                    <th>ACTUAR</th>
		</tr>
                    <% for(int i=0;i<orders.size();i++){
                    DetalleOrden om = orders.get(i);
                    %>
                    <form action="cook?action=updateItemStatus" method="post">
                    <tr>
                        <td><%=i+1 %></td>
                        <td><%=om.getNumeroMesa() %></td>
                        <td><%=om.getIdDetalleOrden() %> <input type="hidden" name="orderId" value="<%= om.getIdDetalleOrden()%>" /> 
                            <input type="hidden" name="itemId" value="<%=om.getIdProducto() %>" /></td>
			<td><%=om.getNombreProducto() %></td>
			<td><%=om.getCantidad() %></td>
			<td><%=om.getEstorden().name() %></td>
			<td><select name="status">
                            <% for(DetalleOrden.EstadoOrden os : DetalleOrden.EstadoOrden.values()){ %>
                            <option><%=os.name() %></option>
                            <%}%>
			</select></td>
			<td><input type="submit" value="ACTUALIZAR" /></td>
                    </tr>
                    </form>
			<%}} else {%>
			<tr>
                            <td>No hay ordenes disponibles</td>
			</tr>
		<%} %>
           </table>
	<a href="ViewOrder.jsp">Volver a la orden</a>
    </body>
</html>