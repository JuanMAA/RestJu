<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader ("Expires", "0");
%> 

<%@page import="Dao.Constantes"%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Restaurant</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="Login.jsp">Ingresar/Loguear</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="HomePage.jsp">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
            </ul>
        </div>
        
        <form action="control?action=login" method="post">
            <h1>LOGIN: <span class="badge badge-secondary">RESTAURANT JUANITO</span></h1>
            <table class="table table-striped">
            
            <tr>
            <%
                if (!Constantes.MENSAJE.equals("") && Constantes.MENSAJE != null) {
                        out.write("<tr><td> " + Constantes.MENSAJE + " </td></tr>");
                    Constantes.MENSAJE = "";
		}
            %>
            </tr>
  <tr>
		<td>USUARIO : <input type="text" name="userName" id="userName" /></td>
            </tr>
            <tr>
		<td>CONTRASEÑA : <input type="password" name="pass" id="pass" /></td>
            </tr>
            <tr>
                <td>
                    <button type="submit" value="INGRESAR" class="btn btn-dark">Ingresar</button>
                    <button type="reset" value="LIMPIAR" class="btn btn-dark">Limpiar</button>                    
                </td>
            </tr>
            </table>
        </form>
    </body>
</html>