<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="Constantes.Constantes"%>

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
			+ Constantes.MENSAJE + " </td></tr>");
			Constantes.MENSAJE = "";
			}
                    %>
                    <tr>
			<td>NOMBRE DE LA CATEGORIA : <input type="text" name="cate" />
                        <button type="submit" value="AÑADIR CATEGORIA" class="btn btn-secondary">AÑADIR CATEGORIA</button>
                    </tr>
		</table>
            </form>
        </body>
</html>