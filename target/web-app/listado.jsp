<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.codoacodo23069.Producto" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="styles.jsp"></jsp:include>
</head>
    <body>
    <jsp:include page="navbar.jsp"></jsp:include>
        <div class="container">
        <div class="row">
            <div class="col-12">
                <% String ok = (String)request.getAttribute("aliminadook");%>
                <% String fail = (String)request.getAttribute("aliminadofail");%>

                <%
                if(ok != null) {
                %>
                    <div class="alert alert-success">
                        exito
                    </div>
                <%
                }
                %>
                <%
                if(fail != null) {
                %>
                    <div class="alert alert-danger">
                        error
                    </div>
                <%
                }
                %>
                <table class="table" id="table">
                    <thead>
                    <tr class="table-success">
                        <th scope="col">#</th>
                        <th scope="col">TITULO</th>
                        <th scope="col">PRECIO</th>
                        <th scope="col">CODIGO</th>
                        <th scope="col">AUTOR</th>
                        <th scope="col">FECHA</th>
                        <th scope="col">ELIMINAR</th>
                        <th scope="col">EDITAR</th>
                    </tr>
                    </thead>
                    <tbody>
                        <% 
                        //bajo el dato del request, que guardo el controller
                        ArrayList<Producto> listado = (ArrayList<Producto>)request.getAttribute("listado");//[]
                        for(Producto unarticulo : listado) {
                        %>
                            <tr class="table-warning">
                                <th scope="row"><%=unarticulo.getId()%></th>
                                <td><%=unarticulo.getTitulo()%></td>
                                <td><%=unarticulo.getPrecio()%></td>
                                <td><%=unarticulo.getCodigo()%></td>
                                <td><%=unarticulo.getAutor()%></td>
                                <td><%=unarticulo.getFecha()%></td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/EliminarController?id=<%=unarticulo.getId()%>" 
                                        class="btn btn-danger" 
                                        tabindex="-1"
                                        role="button"
                                        aria-disabled="true">
                                        Eliminar
                                    </a>
                                </td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/EditarProductoController?id=<%=unarticulo.getId()%>" 
                                        class="btn btn-primary" 
                                        tabindex="-1"
                                        role="button"
                                        aria-disabled="true">
                                        Editar
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
    <jsp:include page="scripts.jsp"></jsp:include>
    </body>
</html>