<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Dao.Constantes"%>
<%@page import="Beans.Orden.EstadoOrden"%>
<%@page import="Beans.Orden"%>
<%@page import="Dao.DaoServicioCocina"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<Orden> orden = new DaoServicioCocina().getAllOrders();
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
            <% if(orden.size() != 0 && orden != null) {%>
            <tr>
                <th>Nº ORDEN</th>
                <th>Nº MESA</th>
		<th>NOMBRE</th>
		<th>ESTADO PEDIDO</th>
		<th>CAMBIAR ESTADO PEDIDO</th>
		<th>ACCION</th>
            </tr>
						
            <% for(int i=0;i<orden.size();i++){
		Orden o = orden.get(i);
            %>
	
            <form action="cook?action=updateOStatus" method="post">
		<tr>
                    <td><%=i+1 %> <input type="hidden" name="orderId" value="<%= o.getIdOrden()%>" /></td>
                    <td><%=o.getNumeroMesa() %></td>
                    <td><a href="ListaProductos.jsp?orderId=<%=o.getIdOrden() %>"><%=o.getaNombreDe() %></a></td>
                    <td><%=o.getEstorden().name() %></td>
                    <td><select name="status"><% for(EstadoOrden os : EstadoOrden.values()){ %>
                        <option><%=os.name() %></option><%}%></select></td>
                    <td><button type="submit"  class="btn btn-secondary">ACTUALIZAR</button></td>
		</tr>
            </form>						
            <%}} else {%>
            <tr>    
                <td>No existen ordenes disponibles</td>
            </tr>
            <%} %>  
        </table>
    </body>
</html>