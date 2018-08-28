<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Beans.Login"%>
<%@page import="Beans.Orden"%>
<%@page import="Beans.Producto"%>
<%@page import="Beans.Categoria"%>
<%@page import="Dao.DaoServiciosUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Constantes.Constantes"%>

<%
    ArrayList<Producto> cats = null;
    Login login = (Login) session.getAttribute(Constantes.USUARIO); 
	if (request.getParameter("catId") != null)
	cats = new DaoServiciosUsuario().getAllItems(Integer.parseInt(request.getParameter("catId")));
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
            <form action="cook?action=makeOrder" method="post">
                <table class="table table-striped">
                    <%
                        if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
			out.write("<tr><td> "
                            + Constantes.MENSAJE + " </td></tr>");
			Constantes.MENSAJE = "";
                        }
                    %>
                    <tr>
			<th>Sr No</th>
			<th>NOMBRE</th>
			<th>CANTIDAD</th>
			<th>COSTO</th>
			<th>CANTIDAD ORDENADA</th>
			<th>ACCION</th>
                    </tr>
                    <%
			if (cats != null && cats.size() != 0) {
			for (int i = 0; i < cats.size(); i++) {
                            Producto c = cats.get(i);
                    %>
                    <tr>
			<td><%=i + 1%></td>
			<input type="hidden" name="idCategoria" value="<%= request.getParameter("catId")%>" />
			<input type="hidden" name="estadoOrden" value="<%=Orden.EstadoOrden.EN_ESPERA.name() %>" />
                        <td><%=c.getNombreProducto()%></td>
			<td><%= c.getCantidad() %></td>
			<td><%=c.getPrecio() %></td>
			<td><input type="number" name="cantidad" value="0" /></td>
			<td><input type="checkbox" name="idProducto" value="<%= c.getIdProducto()%>" /></td>
                    </tr>
                    <%}}%>
                </table>
		Nombre de la orden (De preferencia su nombre) : 
                <input type="text" name="aNombreDe" value="" /> 
                <input type="hidden" name="numeroMesa" value="<%=Integer.parseInt(login.getUsuario()) %>" /> 
                <input type="submit" value="ORDENAR" /> 
                <input type="reset" value="LIMPIAR" />
            </form>
        <a href="Categoria.jsp">VOLVER ATRAS</a>
    </body>
</html>