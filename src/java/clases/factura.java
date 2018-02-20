/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import static clases.metodos.con;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class factura {

    private int fac_id;
    private int subTotalc;
    private int subTotals;
    private double fac_precio;
    private Date fac_fecha;
    private int rc_id;
    private int rs_id;

    public factura(int fac_id, int subTotalc, int subTotals, double fac_precio, Date fac_fecha, int rc_id, int rs_id) {
        this.fac_id = fac_id;
        this.subTotalc = subTotalc;
        this.subTotals = subTotals;
        this.fac_precio = fac_precio;
        this.fac_fecha = fac_fecha;
        this.rc_id = rc_id;
        this.rs_id = rs_id;
    }

    public int getFac_id() {
        return fac_id;
    }

    public void setFac_id(int fac_id) {
        this.fac_id = fac_id;
    }

    public int getSubTotalc() {
        return subTotalc;
    }

    public void setSubTotalc(int subTotalc) {
        this.subTotalc = subTotalc;
    }

    public int getSubTotals() {
        return subTotals;
    }

    public void setSubTotals(int subTotals) {
        this.subTotals = subTotals;
    }

    public double getFac_precio() {
        return fac_precio;
    }

    public void setFac_precio(double fac_precio) {
        this.fac_precio = fac_precio;
    }

    public Date getFac_fecha() {
        return fac_fecha;
    }

    public void setFac_fecha(Date fac_fecha) {
        this.fac_fecha = fac_fecha;
    }

    public int getRc_id() {
        return rc_id;
    }

    public void setRc_id(int rc_id) {
        this.rc_id = rc_id;
    }

    public int getRs_id() {
        return rs_id;
    }

    public void setRs_id(int rs_id) {
        this.rs_id = rs_id;
    }
   

    public factura() {
    }

  

   public  String factura(int idusua, int ids, int idc) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {

        
        String consulta = "";
        String consul = "";
        int rc = 0;
        int rs = 0;
        int tc = 0;
        int ts = 0;
        String msj = "";
        String retornar="";
        Date fecha = null;
        int fc = 0;
        int precio = 0;

        con.ConexionPostgres();
        consul = "select insertarfactur(" + idusua + "," + ids + "," + idc + ") as ps;";
        ResultSet r = con.consultar(consul);
        if (r.next()) {
            msj = r.getString("ps");
        }
        String[] array = msj.split(",");
        int idf = Integer.parseInt(array[1]);
        tc=Integer.parseInt(array[2]);
        this.setSubTotalc(tc);
        ts=Integer.parseInt(array[3]);
        this.setSubTotals(ts);
        if (array[0].equalsIgnoreCase("Su factura se inserto con exito")) {
            consulta = "select fac_id as id, fac_fecha as fec,fac_precio as precio, rc_id as rc, rs_id as rs from factura where fac_id= " + idf + ";";
            ResultSet rx = con.consultar(consulta);
            if (rx.next()) {
                fc = rx.getInt("id");
                this.setFac_id(fc);
                fecha = rx.getDate("fec");
                this.setFac_fecha(fecha);
                precio = rx.getInt("precio");
                this.setFac_precio(precio);
                rc = rx.getInt("rc");
                this.setRc_id(rc);
                rs = rx.getInt("rs");
                this.setRs_id(rs);
                retornar+="factura guardada";
            }
        }
        return retornar;
    }

//    public String registrafac() {
//        String cad = "";
//        int id = clases.metodos.generaid("fac_id", "factura", 50000);
//        setFac_id(id);
//        String consulta = "insert into factura values (" + getFac_id() + ",'" + getFac_fecha() + "'," + getFac_precio() + "," + getRc_id() + "," + getRs_id() + "," + getDesc_id() + ");";
//        boolean reg = clases.metodos.registrar(consulta, getFac_id(), "fac_id", "factura");
//        if (reg) {
//            cad += "<h1>Se ha registrado con exito</h1>";
//        } else {
//            cad += "<h1>No Se ha registrado con exito</h1>";
//        }
//        return cad;
//    }
//
//    public Object[] buscar() {
//        String cad = "";
//        Object[] datos = clases.metodos.buscar(getFac_id(), "fac_id", "factura");
//        if (datos[0] == null) {
//            cad += "<h1>No se encontraron registros</h1>";
//        } else {
//            for (int i = 0; i < datos.length; i++) {
//                cad += " " + datos[i] + " ";
//            }
//        }
//        return datos;
//    }
//
//    public String modificar() {
//        String cad = "";
//        Object[] datos = {getFac_id(), getFac_fecha(), getFac_precio(), getRc_id(), getRs_id(), getDesc_id()};
//        Object[] campos = {"fac_id", "fac_fecha", "fac_precio", "rc_id", "rs_id", "desc_id"};
//        int actualiza = clases.metodos.modificar(datos, campos, "factura", "fac_id", getFac_id());
//        if (actualiza != 0) {
//            cad += "<h1>Se han modificado los datos correctamente</h1>";
//        } else {
//            cad += "<h1>No se ha realizado la modificacion</h1>";
//        }
//        return cad;
//    }



}