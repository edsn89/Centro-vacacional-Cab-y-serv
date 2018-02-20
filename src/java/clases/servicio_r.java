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
public class servicio_r {

    private int sr_id;
    private String sr_fecha;
    private int sr_cantidad;
    private double sr_preciot;
    private int rs_id;
    private int serv_id;

    public servicio_r() {
    }

    public servicio_r(int sr_id, String sr_fecha, int sr_cantidad, double sr_preciot, int rs_id, int serv_id) {
        this.sr_id = sr_id;
        this.sr_fecha = sr_fecha;
        this.sr_cantidad = sr_cantidad;
        this.sr_preciot = sr_preciot;
        this.rs_id = rs_id;
        this.serv_id = serv_id;
    }

    public int getSr_id() {
        return sr_id;
    }

    public void setSr_id(int sr_id) {
        this.sr_id = sr_id;
    }

    public String getSr_fecha() {
        return sr_fecha;
    }

    public void setSr_fecha(String sr_fecha) {
        this.sr_fecha = sr_fecha;
    }

    public int getSr_cantidad() {
        return sr_cantidad;
    }

    public void setSr_cantidad(int sr_cantidad) {
        this.sr_cantidad = sr_cantidad;
    }

    public double getSr_preciot() {
        return sr_preciot;
    }

    public void setSr_preciot(double sr_preciot) {
        this.sr_preciot = sr_preciot;
    }

    public int getRs_id() {
        return rs_id;
    }

    public void setRs_id(int rs_id) {
        this.rs_id = rs_id;
    }

    public int getServ_id() {
        return serv_id;
    }

    public void setServ_id(int serv_id) {
        this.serv_id = serv_id;
    }

    public String registraser_r() {
        String cad = "";
        int id = clases.metodos.generaid("sr_id", "servicio_r", 80000);
        setSr_id(id);
        String consulta = "insert into servicio_r values (" + getSr_id() + ",'" + getSr_fecha() + "'," + getSr_cantidad() + "," + getSr_preciot() + "," + getRs_id() + "," + getServ_id() + ");";
        boolean reg = clases.metodos.registrar(consulta, getSr_id(), "sr_id", "servicio_r");
        if (reg) {
            cad += "<h1>Se ha registrado con exito</h1>";
        } else {
            cad += "<h1>No Se ha registrado con exito</h1>";
        }
        return cad;
    }

    public boolean registraserv_r(int idusua, int rsid) {
        boolean s = false;
        Object[][] servrtemp = metodos.ListarTablaG("select sr_fecha, sr_cantidad, sr_preciot, serv_id from temporal_servicio_r where usua_id= " + idusua + "");
        Object[][] arrayval = new Object[servrtemp.length-1][6];
        int cont = 0;
        int id = 0;
        id = clases.metodos.generaid("sr_id", "servicio_r", 50000);
        for (int i = 1; i < servrtemp.length; i++) {
            setSr_id(id);
            arrayval[i - 1][0] = getSr_id();
            arrayval[i - 1][1] = servrtemp[i][0].toString();
            arrayval[i - 1][2] = Integer.parseInt(servrtemp[i][1].toString());
            arrayval[i - 1][3] = Float.parseFloat(servrtemp[i][2].toString());
            arrayval[i - 1][4] = rsid;
            arrayval[i - 1][5] = Integer.parseInt(servrtemp[i][3].toString());
            id++;
        }
        metodos.Actualizarr("delete from temporal_servicio_r where usua_id=" + idusua +";");
        int reg = metodos.InsertarBloque(arrayval, "servicio_r");
        if (reg != 0) {
            s = true;
        } else {
            s = false;
        }
        return s;
    }

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getSr_fecha(), "sr_fecha", "servicio_r");
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
        Object[] datos = {getSr_id(), getSr_fecha(), getSr_cantidad(), getSr_preciot(), getRs_id(), getServ_id()};
        Object[] campos = {"sr_id", "sr_fecha", "sr_cantidad", "rs_precio", "rs_id", "serv_id"};
        int actualiza = clases.metodos.modificar(datos, campos, "servicio", "sr_id", getSr_id());
        if (actualiza != 0) {
            cad += "<h1>Se han modificado los datos correctamente</h1>";
        } else {
            cad += "<h1>No se ha realizado la modificacion</h1>";
        }
        return cad;
    }

}
