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
public class cabania {

    private int cab_id;
    private String cab_numero;
    private String cab_estado;
    private int tc_id;

    public cabania() {
    }

    public cabania(int cab_id, String cab_numero, String cab_estado, int tc_id) {
        this.cab_id = cab_id;
        this.cab_numero = cab_numero;
        this.cab_estado = cab_estado;
        this.tc_id = tc_id;
    }

    public int getCab_id() {
        return cab_id;
    }

    public void setCab_id(int cab_id) {
        this.cab_id = cab_id;
    }

    public String getCab_numero() {
        return cab_numero;
    }

    public void setCab_numero(String cab_numero) {
        this.cab_numero = cab_numero;
    }

    public String getCab_estado() {
        return cab_estado;
    }

    public void setCab_estado(String cab_estado) {
        this.cab_estado = cab_estado;
    }

    public int getTc_id() {
        return tc_id;
    }

    public void setTc_id(int tc_id) {
        this.tc_id = tc_id;
    }

    public boolean registracab(int cant) {
        int id = 0;
        boolean reg=false;
        this.setCab_estado("disponible");
        String consulta ="";
        for (int i = 0; i < cant; i++) {
            id = metodos.generaid("cab_id", "cabania", 20000);
            this.setCab_id(id);
            this.setCab_numero("NC"+this.getCab_id());
            consulta = "insert into cabania values (" + getCab_id() + ",'" + getCab_numero() + "','" + getCab_estado() + "'," + getTc_id() + ");";
            reg = metodos.registrar(consulta, getCab_id(), "cab_id", "cabania");
        }
        return reg;
    }
    
    public boolean registracabBlque(int cant) {
        int id = 0;
        boolean reg=false;
        String estado="disponible";
        Object[][] datos=new Object[cant][4];
        int tcid=getTc_id();
        id = metodos.generaid("cab_id", "cabania", 20000);
        for (int i = 0; i < datos.length; i++) {
                datos[i][0]=id;
                datos[i][1]="NC"+id;
                datos[i][2]=estado;
                datos[i][3]=tcid;
                id++;
        }
        int actualiza=metodos.InsertarBloque(datos, "cabania");
        if (actualiza != 0) {
            reg=true;
        } else {
            reg=false;
        }
        return reg;
    }
    
    public int obtenercantidad(int idtc){
        int cant=metodos.sabercantidad("select * from cabania where tc_id= "+idtc+";");
        return cant;
    }

    public Object[] buscar() {
        Object[] datos = metodos.buscar(getCab_id(), "cab_id", "cabania");
        this.setCab_id(Integer.parseInt(datos[0].toString()));
        this.setCab_numero(datos[1].toString());
        this.setCab_estado(datos[2].toString());
        this.setTc_id(Integer.parseInt(datos[3].toString()));
        return datos;
    }

    public boolean modificar() {
        boolean upd=false;
        Object[] datos = {getCab_id(), getCab_numero(), getCab_estado(), getTc_id()};
        Object[] campos = {"cab_id", "cab_numero", "cab_estado", "tc_id"};
        int actualiza = metodos.modificar(datos, campos, "cabania", "cab_id", getCab_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }
    
    public String listSelectcab() {
        Object[][] datos = metodos.ListarTabla("cab_id, cab_numero, cab_estado", "cabania", "cab_estado");
        String cade = "";
        for (int i = 1; i < datos.length; i++) {
            for (int j = 0; j < datos[i].length; j = j + 3) {
                cade += "<option value='" + datos[i][j] + "'>" + datos[i][j + 1] + " Estado: " + datos[i][j + 2] + "</option>";
            }
        }
        return cade;
    }

    public String Tablacab() {
        Object[][] datos = metodos.ListarTabla("*", "cabania", "cab_numero");
        String cade ="";
        cade += "<thead>"
                + "<tr><th>Id de Cabania</th>"
                + "<th>Numero de cabania</th>"
                + "<th>Estado cabania</th>"
                + "<th>Tipo cabania</th>"
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
    
    public String llamartabla() {
        String cad = "";
        cad= metodos.ListarCabTipo(getTc_id());
        return cad;
    }
    
    

}
