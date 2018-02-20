/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author PC
 */
public class cabania_r {

    private int cr_id;
    private String cr_fechaentrada;
    private String cr_fechasalida;
    private int rc_id;
    private int cab_id;
    public cabania_r() {
    }

    public cabania_r(int cr_id, String cr_fechaentrada, String cr_fechasalida, int rc_id, int cab_id) {
        this.cr_id = cr_id;
        this.cr_fechaentrada = cr_fechaentrada;
        this.cr_fechasalida = cr_fechasalida;
        this.rc_id = rc_id;
        this.cab_id = cab_id;
    }

    public int getCr_id() {
        return cr_id;
    }

    public void setCr_id(int cr_id) {
        this.cr_id = cr_id;
    }

    public String getCr_fechaentrada() {
        return cr_fechaentrada;
    }

    public void setCr_fechaentrada(String cr_fechaentrada) {
        this.cr_fechaentrada = cr_fechaentrada;
    }

    public String getCr_fechasalida() {
        return cr_fechasalida;
    }

    public void setCr_fechasalida(String cr_fechasalida) {
        this.cr_fechasalida = cr_fechasalida;
    }

    public int getRc_id() {
        return rc_id;
    }

    public void setRc_id(int rc_id) {
        this.rc_id = rc_id;
    }

    public int getCab_id() {
        return cab_id;
    }

    public void setCab_id(int cab_id) {
        this.cab_id = cab_id;
    }

    public boolean registracab_r(int idusua, int rcid) {
        boolean s=false;
        Object[][] cabrtemp = metodos.ListarTablaG("select usua_id, cr_fechaentrada, cr_fechasalida, tc_id, cr_cantidad, cr_preciot from temporal_cabania_r where usua_id= " + idusua + ";");
        int filastemp = metodos.obtenerundatoInt("select sum(cr_cantidad) as cantidad from temporal_cabania_r where usua_id=" + idusua + "", "cantidad");
        Object[][] arrayval = new Object[filastemp][5];
        int tipc = 0;
        int cont = 0;
        int cantid = 0;
        int id =0;
       int idcab=0;
       id = clases.metodos.generaid("cr_id", "cabania_r", 30000);
        for (int i = 1; i < cabrtemp.length; i++) {
            tipc = Integer.valueOf(cabrtemp[i][3].toString());
            cantid = metodos.obtenerundatoInt("select cr_cantidad from temporal_cabania_r where usua_id=" + idusua + " and tc_id=" + tipc + ";", "cr_cantidad");
            for (int j = 0; j < cantid; j++) {
                setCr_id(id);
                arrayval[cont][0] = getCr_id();
                arrayval[cont][1] = cabrtemp[i][1].toString();
                arrayval[cont][2] = cabrtemp[i][2].toString();
                arrayval[cont][3] = rcid;
                idcab=metodos.saberid("select cab_id from cabania where tc_id=" + tipc + " and cab_estado='disponible';", "cab_id");
                arrayval[cont][4] = idcab;
                metodos.Actualizarr("update cabania set cab_estado='reservado' where cab_id="+idcab+";");
                id++;
                cont++;
            }
            metodos.Actualizarr("delete from temporal_cabania_r where usua_id=" + idusua + " and tc_id=" + tipc + ";");
        }
        int reg=metodos.InsertarBloque(arrayval, "cabania_r");
        if (reg!=0) {
            s=true;
        } else {
            s=false;
        }
        return s;
    }

    public String Tabla() {
        Object[][] datos = metodos.ListarTabla("*", "servicio", "serv_nombre");
        String cade ="";
        cade += "<table><thead>"
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
        cade += "</tbody></table>";
        return cade;
    }
    
    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getCr_fechaentrada(), "cr_fechaentrada", "cabania_r");
        if (datos[0] == null) {
            cad += "<h1>No se encontraron registros</h1>";
        } else {
            for (int i = 0; i < datos.length; i++) {
                cad += " " + datos[i] + " ";
            }
        }
        return datos;
    }

    public String modificar() {
        String cad = "";
        Object[] datos = {getCr_id(), getCr_fechaentrada(), getCr_fechasalida(), getRc_id(), getCab_id()};
        Object[] campos = {"cr_id", "cr_fechaentrada", "cr_fechasalida", "rc_id", "cab_id"};
        int actualiza = clases.metodos.modificar(datos, campos, "cabania_r", "cr_id", getCr_id());
        if (actualiza != 0) {
            cad += "<h1>Se han modificado los datos correctamente</h1>";
        } else {
            cad += "<h1>No se ha realizado la modificacion</h1>";
        }
        return cad;
    }
    
    public String llamartabla() {
        String cad = "";
        cad= metodos.ListarFacturas(getCr_fechaentrada(), getCr_fechasalida());
        return cad;
    }

}
