package ar.com.codoacodo.controllers;

import java.io.IOException;

import ar.com.codoacodo.dao.DAO;
import ar.com.codoacodo.dao.impl.MysqlDaoImpl;
import ar.com.codoacodo23069.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditarProductoController")
public class EditarProductoController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");

        DAO dao = new MysqlDaoImpl();

        try {
            Producto producto = dao.getById(Long.parseLong(id));
            req.setAttribute("producto", producto);
            getServletContext().getRequestDispatcher("/modificarTabla.jsp").forward(req, resp);
        } catch (Exception e) {
            // TODO: handle exception
            getServletContext().getRequestDispatcher("/ListadoProductosController").forward(req, resp);
        }
        
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws SecurityException, IOException {

        String nuevoTitulo = req.getParameter("nombre");//request.getTitulo();
        String nuevoAutor = req.getParameter("autor");
        double nuevoPrecio = Double.parseDouble(req.getParameter("precio"));
        String nuevaImagen = req.getParameter("imagen");
        String nuevoCodigo = req.getParameter("codigo");

        Producto productoEditado = new Producto(nuevoTitulo, nuevoAutor, nuevoPrecio, nuevaImagen, nuevoCodigo);

        DAO dao = new MysqlDaoImpl();

        try {
            dao.update(productoEditado);
            getServletContext().getRequestDispatcher("ListadoProductoController").forward(req, resp);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            getServletContext().getRequestDispatcher("modificarTabla.jsp");
        }

    }
}
