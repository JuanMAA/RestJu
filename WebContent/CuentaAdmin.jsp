<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Beans.Login"%>
<%@page import="Beans.DetalleCuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoServiciosUsuario"%>
<%@page import="Constantes.Constantes"%>

<%
	DaoServiciosUsuario su = new DaoServiciosUsuario(); 
	String tblNo = "0";
            if(request.getParameter("tableNo") != null)
            {
                tblNo = request.getParameter("tableNo");
            }
	ArrayList<DetalleCuenta> bDetails = su.getBill(Integer.parseInt(tblNo));
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
            <form action="CuentaAdmin.jsp" method="post">
		<table class="table table-striped">
                    <tr>
			<td>NUMERO DE LA MESA A DISPOSICION</td>
			<td>
                            <select name="tableNo">
                                <option value="1">Mesa NRº 1</option> 
                                <option value="2">Mesa NRº 2</option>
                                <option value="3">Mesa NRº 3</option>
                                <option value="4">Mesa NRº 4</option>
                                <option value="5">Mesa NRº 5</option>						
                            </select>
                        </td>					
			<td colspan="2">
                            <button type="submit" class="btn btn-secondary">BUSCAR</button>
			</td>
                    </tr>
		</table>
                    </form>	
                    <% if(bDetails != null && !bDetails.isEmpty()) {%>			
			
                <table class="table table-striped">
                            <%
                            if (!Constantes.MENSAJE.equals("")&& Constantes.MENSAJE != null) {
                                out.write("<tr><td'> "
                                + Constantes.MENSAJE + " </td></tr>");
                                Constantes.MENSAJE = "";
                            }
                            %>
                    <tr>
			<th>Sr No</th>
			<th>NUMERO ORDEN</th>
			<th>NOMBRE PRODUCTO</th>
			<th>PRECIO UNTARIO PRODUCTO</th>
			<th>STOCK PRODUCTO</th>
			<th>CANTIDAD PRODUCTO ODENADO</th>
			<th>PRECIO</th>
                    </tr>
			<% double total = 0; %>
			<%for(int i=0; i < bDetails.size(); i++)
                            {
                            DetalleCuenta dc = bDetails.get(i);
			%>
                    <tr>
                        <td><%=i+1 %></td>
                        <td><%=dc.getOrderName() %></td>
			<td> <%=dc.getItemName() %></td>
                        <td> <%=dc.getItemCost() %></td>
			<td><%=dc.getItemQnt() %></td>
			<td><%=dc.getOrderQnt() %></td>
			<td> <%=Double.parseDouble(dc.getItemCost()) * dc.getOrderQnt() %>
                            <% total = (Double.parseDouble(dc.getItemCost()) * dc.getOrderQnt()) + total; %>
			</td>
                    </tr>
			<%}%>
                    <tr>
			<td>TOTAL</td>
			<td ><%=total %></td>
                    </tr>									
                </table>
            <%}else{%>
                 No hay una cuenta disponible para la mesa: <%=request.getParameter("tableNo") %>
            <% }%>
      </body>
</html>