/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import bd.Conexion;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import clases.metodos;

/**
 *
 * @author EDSN-PC
 */
public class servicio {
    private int serv_id;
    private String serv_nombre;
    private String serv_descripcion;
    private float serv_precio;

    public servicio() {
    }

    public servicio(int serv_id, String serv_nombre, String serv_descripcion, float serv_precio) {
        this.serv_id = serv_id;
        this.serv_nombre = serv_nombre;
        this.serv_descripcion = serv_descripcion;
        this.serv_precio = serv_precio;
    }

    public int getServ_id() {
        return serv_id;
    }

    public void setServ_id(int serv_id) {
        this.serv_id = serv_id;
    }

    public String getServ_nombre() {
        return serv_nombre;
    }

    public void setServ_nombre(String serv_nombre) {
        this.serv_nombre = serv_nombre;
    }

    public String getServ_descripcion() {
        return serv_descripcion;
    }

    public void setServ_descripcion(String serv_descripcion) {
        this.serv_descripcion = serv_descripcion;
    }

    public float getServ_precio() {
        return serv_precio;
    }

    public void setServ_precio(float serv_precio) {
        this.serv_precio = serv_precio;
    }

    

        public boolean registraserv() {
        boolean reg = false;
        int id = metodos.generaid("serv_id", "servicio", 10000);
        setServ_id(id);
        String consulta = "insert into servicio values (" + getServ_id() + ",'" + getServ_nombre() + "','" + getServ_descripcion() + "'," + getServ_precio() + ");";
        reg = metodos.registrar(consulta, getServ_nombre(), "serv_nombre", "servicio");
        return reg;
    }
    

    public Object[] buscar() {
        Object[] datos = metodos.buscar(getServ_id(), "serv_id", "servicio");
        this.setServ_id(Integer.parseInt(datos[0].toString()));
        this.setServ_nombre(datos[1].toString());
        this.setServ_descripcion(datos[2].toString());
        this.setServ_precio(Float.parseFloat(datos[3].toString()));
        return datos;
    }

    public boolean modificar() {
        boolean upd=false;
        Object[] datos = {getServ_id(), getServ_nombre(), getServ_descripcion(), getServ_precio()};
        Object[] campos = {"serv_id", "serv_nombre", "serv_descripcion", "serv_precio"};
        int actualiza = metodos.modificar(datos, campos, "servicio", "serv_id", getServ_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }
    
    public String listSelectserv() {
        Object[][] datos = metodos.ListarTabla("serv_id, serv_nombre", "servicio", "serv_nombre");
        String cade = "";
        for (int i = 1; i < datos.length; i++) {
            for (int j = 0; j < datos[i].length; j = j + 2) {
                cade += "<option value='" + datos[i][j] + "'>" + datos[i][j + 1] + "</option>";
            }
        }
        return cade;
    }
    
    public String Tablaserv() {
        Object[][] datos = metodos.ListarTabla("*", "servicio", "serv_nombre");
        String cade ="";
        cade += "<thead>"
                + "<tr><th>Id Servicio</th>"
                + "<th>Nombre Servicio</th>"
                + "<th>Descripcion Servicio</th>"
                + "<th>Precio Servicio</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "<td style=\"width:80px;\"> <a href=\"\" class=\"btn btn-danger btn-xs\">Eliminar</a></td></tr>";
        }
        cade += "</tbody>";
        return cade;
    }

}
