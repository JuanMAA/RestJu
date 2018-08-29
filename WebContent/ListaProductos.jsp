<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Beans.DetalleOrden"%>
<%@page import="Dao.Constantes"%>
<%@page import="Beans.Orden.EstadoOrden"%>
<%@page import="Beans.Orden.EstadoOrden"%>
<%@page import="Beans.Orden"%>
<%@page import="Dao.DaoServicioCocina"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<DetalleOrden> orden = null;
	if(request.getParameter("orderId") != null )
	orden = new DaoServicioCocina().getAllItems(Integer.parseInt(request.getParameter("orderId")));
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="refresh" content="4" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
            <table class="table table-striped">
            <%
		if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
                out.write("<tr><td'> "
                    + Constantes.MENSAJE + " </td></tr>");
		Constantes.MENSAJE = "";
		}
            %>
            <% if(orden.size() != 0 && orden != null) {%>
            <tr>
		<th>Sr No</th>
		<th>NROº MESA</th>
		<th>NROº ORDEN</th>
		<th>NOMBRE PRODUCTO</th>
		<th>CANTIDAD</th>
		<th>ESTADO</th>
            </tr>
            <% for(int i=0;i<orden.size();i++){
                DetalleOrden o = orden.get(i);
            %>
            
            <form action="cook?action=updateItemtatus" method="post">
                <tr>
                    <td><%=i+1 %></td>
                    <td><%=o.getNumeroMesa() %></td>
                    <td><%=o.getIdDetalleOrden() %> <input type="hidden" name="orderId" value="<%= o.getIdDetalleOrden()%>" /> 
                        <input type="hidden" name="itemId" value="<%=o.getIdProducto() %>" />
                    </td>
                    <td><%=o.getNombreProducto() %></td>
                    <td><%=o.getCantidad() %></td>
                    <td><%=o.getEstorden().name() %></td>
		</tr>
            </form>
		<%}
		} else {%>
                    <tr>
                        <td>NO HAY ORDENES DISPONIBLESe</td>
                    </tr>
		<%} %>
            </table>
        <a href="Orden.jsp">VOLVER ATRAS</a>
    </body>
</html>