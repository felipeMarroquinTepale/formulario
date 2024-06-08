<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
 Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

    <div class="row justify-content-center">

        <%
        if(errores != null && errores.size()>0){
        %>
        <ul class="alert alert-danger mx-5 px-5">
            <% for(String error: errores.values()){%>
            <li><%=error%></li>
                <%}%>
        </ul>
        <%}%>

        <div class="card shadow w-50 mt-5 px-5">
            <h3 class="text-center">Formulario de productos</h3>
            <form action="/webapp-tarea2/crear" method="post">
                <div class="row mb-3 mt-3">
                    <label for="nombre">nombre</label>
                    <div>
                        <input type="text" name="nombre" id="nombre" class="form-control" value="${param.nombre}">
                    </div>

                    <%
                        if(errores != null && errores.containsKey("nombre")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("nombre") + "</small>");
                       }
                    %>
                </div>

                <div class="row mb-3">
                    <label for="precio">Precio</label>
                    <div>
                        <input type="number" name="precio" id="precio" min="1" step="1" class="form-control" value="${param.precio}">
                    </div>
                    <%
                        if(errores != null && errores.containsKey("precio")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("precio") + "</small>");
                        }
                    %>
                </div>

                <div class="row mb-3">
                    <label for="fabricante">Fabricante</label>
                    <div>
                        <input type="text" name="fabricante" id="fabricante" class="form-control" minlength="4" maxlength="10" value="${param.fabricante}">
                    </div>
                    <%
                        if(errores != null && errores.containsKey("fabricante")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("fabricante") + "</small>");
                        }
                    %>
                </div>

                <div class="row mb-3">
                    <label for="categoria">Categoria</label>
                    <div>
                        <select name="categoria" id="categoria" class="form-select">
                            <option value="">-- seleccionar --</option>
                            <option value="Electronica" ${paramValues.categoria.stream().anyMatch(v->v.equals("Electronica")).get()?"selected":""}>Electronica</option>
                            <option value="Ropa y moda" ${paramValues.categoria.stream().anyMatch(v->v.equals("Ropa y moda")).get()?"selected":""}>Ropa y moda</option>
                            <option value="Alimentos y bebidas" ${paramValues.categoria.stream().anyMatch(v->v.equals("Alimentos y bebidas")).get()?"selected":""}>Alimentos y bebidas</option>
                            <option value="Automotriz" ${paramValues.categoria.stream().anyMatch(v->v.equals("Automotriz")).get()?"selected":""}>Automotriz</option>
                        </select>
                    </div>
                    <%
                        if(errores != null && errores.containsKey("categoria")){
                            out.println("<small class='alert alert-danger col-sm-4' style='color: red;'>"+ errores.get("categoria") + "</small>");
                        }
                    %>
                </div>
                <div class="d-grid gap-2 m-5">
                    <button class="btn btn-primary" value="Enviar" type="submit">Enviar</button>
                </div>

            </form>
        </div>
    </div>

</body>
</html>