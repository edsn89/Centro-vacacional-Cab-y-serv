/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import bd.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import clases.metodos;

/**
 *
 * @author Leidy
 */
public class tipocab {
    private int tc_id;
    private String tc_nombre;
    private String tc_descripcion;
    private float tc_precio;

    public tipocab() {
    }

    public tipocab(int tc_id, String tc_nombre, String tc_descripcion, float tc_precio) {
        this.tc_id = tc_id;
        this.tc_nombre = tc_nombre;
        this.tc_descripcion = tc_descripcion;
        this.tc_precio = tc_precio;
    }

    public int getTc_id() {
        return tc_id;
    }

    public void setTc_id(int tc_id) {
        this.tc_id = tc_id;
    }

    public String getTc_nombre() {
        return tc_nombre;
    }

    public void setTc_nombre(String tc_nombre) {
        this.tc_nombre = tc_nombre;
    }

    public String getTc_descripcion() {
        return tc_descripcion;
    }

    public void setTc_descripcion(String tc_descripcion) {
        this.tc_descripcion = tc_descripcion;
    }

    public float getTc_precio() {
        return tc_precio;
    }

    public void setTc_precio(float tc_precio) {
        this.tc_precio = tc_precio;
    }

    public boolean registratipoc() {
        boolean reg = false;
        int id = metodos.generaid("tc_id", "tipocab", 90000);
        setTc_id(id);
        String consulta = "insert into tipocab values (" + getTc_id() + ",'" + getTc_nombre() + "', '" + getTc_descripcion() + "'," + getTc_precio() + ");";
        reg = metodos.registrar(consulta, getTc_nombre(), "tc_nombre", "tipocab");
        return reg;
    }

    public Object[] buscar() {
        Object[] datos = metodos.buscar(getTc_id(), "tc_id", "tipocab");
        this.setTc_id(Integer.parseInt(datos[0].toString()));
        this.setTc_nombre(datos[1].toString());
        this.setTc_descripcion(datos[2].toString());
        this.setTc_precio(Float.parseFloat(datos[3].toString()));
        return datos;
    }

    public boolean modificar() {
        boolean upd=false;
        Object[] datos = {getTc_id(), getTc_nombre(), getTc_descripcion(), getTc_precio()};
        Object[] campos = {"tc_id", "tc_nombre", "tc_descripcion", "tc_precio"};
        int actualiza = metodos.modificar(datos, campos, "tipocab", "tc_id", getTc_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }

    public String listSelecttc() {
        Object[][] datos = metodos.ListarTabla("tc_id, tc_nombre", "tipocab", "tc_nombre");
        String cade = "";
        for (int i = 1; i < datos.length; i++) {
            for (int j = 0; j < datos[i].length; j = j + 2) {
                cade += "<option value='" + datos[i][j] + "'>" + datos[i][j + 1] +"</option>";
            }
        }
        return cade;
    }

    public String Tablatc() {
        Object[][] datos = metodos.ListarTabla("*", "tipocab", "tc_nombre");
        String cade ="";
        cade += "<thead>"
                + "<tr><th>Id Tipo cabania</th>"
                + "<th>Nombre Tipo cabania</th>"
                + "<th>Descripcion Tipo cabania</th>"
                + "<th>Precio Tipo cabania</th>"
                + "<th>Elimina</th>"
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
