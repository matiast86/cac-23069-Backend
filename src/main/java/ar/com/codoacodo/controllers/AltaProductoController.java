package ar.com.codoacodo.controllers;

import ar.com.codoacodo.dao.DAO;
import ar.com.codoacodo.dao.impl.MysqlDaoImpl;
import ar.com.codoacodo23069.Producto;

public class AltaProductoController {
 
    //asumimos que es creado por la jvm! 
    public void doPost(Request request,Response response) {

        //asumimos que aca llegan lo parametros desde el formulario
        String titulo = "harry potter ";//request.getTitulo();
        String autor = "autor de harry potter";
        double precio = 1500.5;
        String imagen = "http://bla.com.ar/algo.jpg";
        String codigo = "ZZZ000";

        //ahora nace el producto EN JVM, pero no existe en la DB!
        //NO INSERT INTO....
        Producto nuevoProducto = new Producto(titulo, autor, precio, imagen,codigo);

        //ahora debo insertar en la base de datos
        //llamar a la implementacion del dao y pasarle el objeto nuevoProducto
        //Interface i = new ClaseQueImplementa();
        DAO dao = new MysqlDaoImpl();
        
        try {
            dao.create(nuevoProducto);//f5
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
