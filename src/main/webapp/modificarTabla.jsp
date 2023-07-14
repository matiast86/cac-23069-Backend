<%@ page import="java.util.ArrayList" %>
<%@ page import="ar.com.codoacodo23069.Producto" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="styles.jsp"></jsp:include>
    <style>
        .container {
            margin-top: 20px;
            background-color: antiquewhite;
        }
    </style>
</head>
    <body>
    <jsp:include page="navbar.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <section>
                        <h1>Modificacion Articulo</h1>
                        <!--<%=request.getContextPath()%> se convierte en el contexto
                        /web-app
                        -->
                        <% 
                        //bajo el dato del request, que guardo el controller
                        Producto producto = (Producto)request.getAttribute("producto");//[]
                        %>
                        <form method="post" action="<%=request.getContextPath()%>/EditarProductoController?id=<%=producto.getId()%>">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" 
                                    class="form-label">Nombre</label>
                                <input name="nombre" 
                                    type="text" 
                                    class="form-control" 
                                    id="exampleFormControlInput1"
                                    placeholder="Nombre"
                                    value="<%=producto.getTitulo()%>"
                                    maxlength="50">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" 
                                    class="form-label">Precio
                                </label>
                                <input name="precio" 
                                    type="number" 
                                    class="form-control" 
                                    value="<%=producto.getPrecio()%>"
                                    id="exampleFormControlTextarea1">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" 
                                    class="form-label">Im&aacute;gen
                                </label>
                                <input name="imagen" 
                                    type="file" 
                                    class="form-control" 
                                    id="exampleFormControlTextarea1">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" 
                                    class="form-label">C&oacute;digo
                                </label>
                                <input name="codigo" 
                                    type="text"
                                    value="<%=producto.getCodigo()%>" 
                                    class="form-control" 
                                    id="exampleFormControlTextarea1" 
                                    maxlength="7">
                            </div>
                            <div class="mb-3">
                                <label for="autor" 
                                    class="form-label">Autor
                                </label>
                                <input name="autor" 
                                    type="text"
                                    value="<%=producto.getAutor()%>" 
                                    class="form-control" 
                                    id="autor" 
                                    maxlength="50">
                            </div>
                            <button class="btn btn-primary">
                                Guardar cambios
                            </button>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    <jsp:include page="scripts.jsp"></jsp:include>
    </body>

</html>