package org.marroquin.apiservlet.tarea2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet({"/crear",""})
public class RegistroProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // cual debe despachar (forward) a la vista form.jsp que contiene el formulario html
        getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String nombre = req.getParameter("nombre");
        String precio = req.getParameter("precio");
        String fabricante = req.getParameter("fabricante");
        String categoria = req.getParameter("categoria");

        Map<String,String> errores = new HashMap<>();

        if (nombre==null || nombre.isBlank()){
            errores.put("nombre","El campo nombre es requerido");
        }
        if (fabricante==null || fabricante.isBlank()){
            errores.put("fabricante","El campo fabricante es requerido");
        }
        if(precio==null || precio.isBlank()){
            errores.put("precio","El campo precio es requerido");
        }
        if(categoria==null || categoria.isBlank()){
            errores.put("categoria","El campo categoria es requerido");
        }

        resp.setContentType("text/html");

        if(errores.isEmpty()){
            try (PrintWriter out = resp.getWriter()){
                out.print("<!DOCTYPE hml>");
                out.print("<html>");
                out.print("     <head>");
                out.print("         <meta charset=\"UTF-8\">");
                out.print("         <title> </title>");
                out.print("     </head>");
                out.print("     <body>");
                out.print("         <h4>nombre: "+nombre+" </h4>");
                out.print("         <h4>precio: "+precio+" </h4>");
                out.print("         <h4>fabricante: "+fabricante+" </h4>");
                out.print("         <h4>categoria: "+categoria+" </h4>");
                out.print("     </body>");
                out.print("</html>");
            }
        }else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
