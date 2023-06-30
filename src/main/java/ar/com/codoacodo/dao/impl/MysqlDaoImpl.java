package ar.com.codoacodo.dao.impl;

import java.util.ArrayList;

import ar.com.codoacodo.dao.AdministradorDeConexiones;
import ar.com.codoacodo.dao.DAO;
import ar.com.codoacodo23069.Producto;

import java.sql.Connection;//es una interface de JDBC que está implementado en el conector=driver=depedencia=artefacto=libreria de mysql
import java.sql.Date;
//que agregamos al pom.xml
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/* implemento el contrato = interface DAO
 * 
 */
public class MysqlDaoImpl implements DAO{
    
    public void create(Producto producto) throws Exception{
        
        //vamos a ver la clase que viene JDBC
        Connection connection = AdministradorDeConexiones.getConnection();//f5
        
        //ahora si armo el sql para hacer un INSERT                                      1  2  3  4  5
        String sql = "INSERT INTO productos (titulo, fecha, autor,codigo,imagen) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pst = connection.prepareStatement(sql);

        //ahora seteo los valores 
        pst.setString(1, producto.getTitulo());
        //pst.setDate(2, producto.getFecha().g);//??
        pst.setDate(2, new Date(System.currentTimeMillis()));//??
        pst.setString(3, producto.getAutor());
        pst.setString(4, producto.getCodigo());
        pst.setString(5, producto.getImagen());

        pst.executeUpdate();
        //ResultSet
    }

    @Override
    public Producto getById(Long id) throws Exception{
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getById'");
    }

    @Override
    public void delete(Long id) throws Exception{
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }

    @Override
    public ArrayList<Producto> findAll() throws Exception{
        //vamos a ver la clase que viene JDBC
        Connection connection = AdministradorDeConexiones.getConnection();//f5
        
        //ahora si armo el sql para hacer un INSERT                                      1  2  3  4  5
        String sql = "select * from productos";
        PreparedStatement pst = connection.prepareStatement(sql);
        
        ResultSet res =  pst.executeQuery();
        
        ArrayList<Producto> listado  = new ArrayList<>();
        //extraer los datos del res!
        while(res.next()) {
            //aca uds hace la magia
            Long id =res.getLong(1);
            String titulo = res.getString(2);
            String img = res.getString(3);
            Date fecha = res.getDate(4);
            String codigo = res.getString(5);
            String autor = res.getString(6);
            
            listado.add(new Producto(titulo, autor, 0, img, codigo));
        }

        return listado;
    }

    @Override
    public void update(Producto articulo) throws Exception{
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }
}
