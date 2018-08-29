<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.awt.print.Book"%>
<%@page import="java.util.Date"%>
<%@page import="Beans.Login"%>
<%@page import="Beans.Orden.EstadoOrden"%>
<%@page import="Dao.DaoServicioCocina"%>
<%@page import="Beans.Orden"%>
<%@page import="Beans.Producto"%>
<%@page import="Beans.Categoria"%>
<%@page import="Dao.DaoServiciosUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Constantes.Constantes"%>

<%! 
    boolean isLastOrderDeliverd = Boolean.FALSE;
    boolean isLongTime = Boolean.FALSE;
%>

<%
    Login log = (Login) session.getAttribute(Constantes.USUARIO);
    ArrayList<Orden> orden = new DaoServiciosUsuario().getAllOrders(Integer.parseInt(log.getUsuario()));
        if(isLastOrderDeliverd)
            {
            if(session.getAttribute("isLastOrdered") == null && session.getAttribute("time" ) == null){
		session.setAttribute("time", new Date());
		System.out.println("session set");
                }
            }

        if(session.getAttribute("isLastOrdered") != null && session.getAttribute("time") != null){	
	Date date = (Date) session.getAttribute("time");
	Date update = new Date();
	
	long diff = date.getTime() - update.getTime();
	 
	long diffSeconds = diff / 1000 % 60;
	long diffMinutes = diff / (60 * 1000) % 60;
	long diffHours = diff / (60 * 60 * 1000) % 24;
	long diffDays = diff / (24 * 60 * 60 * 1000);

	if(diffHours >= -1)
	{
		isLongTime = Boolean.TRUE;
	}

        }else{ 
	System.out.println("Algunos valores son nulos");
	session.setAttribute("Tiempo", null);
	session.setAttribute("Por ultima vez", null);
        }
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
		if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
                out.write("<tr><td'> "
                    + Constantes.MENSAJE + " </td></tr>");
                    Constantes.MENSAJE = "";
                }
            
            if(isLongTime)
            {%>
            <tr>
                <th>Tu tiempo termino desocupa la mesa para otro cliente</th>
            </tr>
            <%}%>
                <% if(orden.size() != 0 && orden != null) {%>
            <tr>
		<th>Sr No</th>
		<th>NRº MESA</th>
		<th>NOMBRE DE ORDEN</th>
		<th>ESTADO</th>
            </tr>
		<% for(int i=0;i<orden.size();i++){
                    Orden om = orden.get(i);
		%>
            <tr>
		<td><%=i+1 %> <input type="hidden" name="orderId" value="<%= om.getIdOrden()%>" /></td>
                <td><%=om.getNumeroMesa() %></td>
		<td><a href="ViewOrderedItemsList.jsp?orderId=<%=om.getIdOrden() %>"><%=om.getaNombreDe() %></a></td>
		<td><%=om.getEstorden().name() %></td>
                    <% if(om.getEstorden().name().equals(Orden.EstadoOrden.PEDIDO_ENTREGADO.name())) 
                        {isLastOrderDeliverd = Boolean.TRUE;} else {isLastOrderDeliverd = Boolean.FALSE;}
                    %>
            </tr>
		<%}} else {%>
            <tr>
		<td>No existe ninguna orden disponible</td>
            </tr>
		<%} %>
        </table>
    </body>
</html>