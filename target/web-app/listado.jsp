<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.codoacodo23069.Producto" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CaC - 23069</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">TÍTULO</th>
                    <th scope="col">PRECIO</th>
                    <th scope="col">CÓDIGO</th>
                    <th scope="col">AUTOR</th>
                    <th scope="col">IMÁGEN</th>
                    <th scope="col">------</th>
                  </tr>
                </thead>
                <tbody>
                    <% 
                    //bajo el dato del request, que guardo el controller
                    ArrayList<Producto> listado = (ArrayList<Producto>)request.getAttribute("listado");//[]
                    for(Producto unarticulo : listado) {
                    %>
                        <tr>
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
                        </tr>
                    <% } %>
                </tbody>
              </table>
        </div>
      </div>
    </div>
</body>
</html>