
<%@page import="java.util.Date"%>
<%@page import="Constantes.Constantes"%>
<%@page import="Beans.Login"%>

<%
    Login login =(Login) session.getAttribute(Constantes.USUARIO);
%>

<div class="templatemo_content_left_section">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    <h1>JUANITO <span icon="glyphicon glyphicon-cutlery" class="badge badge-secondary">RESTAURANT</span></h1>
        
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
      		<% if(login.getUsuario().equals("cook")){%>
                <a class="navbar-brand" href="#">Nombre Cuenta : <span class="badge badge-secondary"><%= login.getUsuario() %></span></a>
                <a class="nav-item nav-link" href="AgregarCategoria.jsp">Añadir Categoria</a></li>
                <a class="nav-item nav-link" href="AgregarProducto.jsp">Añadir Producto</a></li>
                <a class="nav-item nav-link" href="Orden.jsp">Ver Ordenes</a></li>
                <a class="nav-item nav-link" href="CuentaAdmin.jsp">Ver Cuentas</a>
                <a class="nav-item nav-link" href="Login.jsp">Salir</a></li>    
      		<%} else{%>
                <a class="navbar-brand" href="#">Numero de mesa : <span class="badge badge-secondary">Mesa <%= login.getUsuario() %></span></a>
                <a class="nav-item nav-link" href="Categoria.jsp">Ordenar</a></li>
                <a class="nav-item nav-link" href="EstadoOrden.jsp">Estado de Orden</li>
                <a class="nav-item nav-link" href="Cuenta.jsp">Cuenta</a></li>
                <a class="nav-item nav-link" href="Login.jsp">Salir</a></li> 
               <%} %>
            </div>
        </div>
    </nav>                    
</div>