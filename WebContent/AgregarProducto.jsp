<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Constantes.Constantes"%>
<%@page import="Dao.DaoServicioCocina"%>
<%@page import="Beans.Categoria"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Categoria> cat = new DaoServicioCocina().getAllCategorys();
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
    </head>
    
    <body>
	<jsp:include page="MenuHeader.jsp"/>
            <form action="cook?action=addItem" method="post">
                <table class="table table-striped">
                <%
                    if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
                    out.write("<tr><td> "+ Constantes.MENSAJE + " </td></tr>");
                    Constantes.MENSAJE = "";
                    }
		%>
		<tr>
                    <td>NOMBRE ITEM :</td>
                    <td><input type="text" name="itemName" size="22" /></td>
		</tr>
		<tr>
                    <td>CATEGORIA :</td>
                    <td><select name="categoryId">
                        <option>OPCIONES POR CATEGORIA</option>
                    <%if(cat != null && cat.size() != 0){ 
                        for(int i=0;i <cat.size();i++)
			{
                        Categoria ca = cat.get(i);
                    %>
			<option value="<%=ca.getIdCategoria()%>">
			<%=ca.getNombreCategoria() %></option>
                    <%}} %>
                    </select></td>
		</tr>
		<tr>
                    <td>CANTIDAD :</td>
                    <td><input type="number" name="qnt"/></td>
		</tr>
		<tr>
                    <td>PRECIO INDIVIDUAL :</td>
                    <td><input type="text" name="cost"/></td>
		</tr>
                <tr>
                    <td><button type="submit" value="AÑADIR CATEGORIA" class="btn btn-secondary">AÑADIR</button></td>
                    <td><button type="reset" value="AÑADIR CATEGORIA" class="btn btn-secondary">RESETEAR</button></td>
		</tr>
            </table>
        </form>
    </body> 
</html>