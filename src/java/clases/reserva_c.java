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
public class reserva_c {

    private int rc_id;
    private int rc_cod;
    private String rc_estado;
    private int usua_id;

    public reserva_c() {
    }

    public reserva_c(int rc_id, int rc_cod, String rc_estado, int usua_id) {
        this.rc_id = rc_id;
        this.rc_cod = rc_cod;
        this.rc_estado = rc_estado;
        this.usua_id = usua_id;
    }

    public int getRc_id() {
        return rc_id;
    }

    public void setRc_id(int rc_id) {
        this.rc_id = rc_id;
    }

    public int getRc_cod() {
        return rc_cod;
    }

    public void setRc_cod(int rc_cod) {
        this.rc_cod = rc_cod;
    }

    public String getRc_estado() {
        return rc_estado;
    }

    public void setRc_estado(String rc_estado) {
        this.rc_estado = rc_estado;
    }

    public int getUsua_id() {
        return usua_id;
    }

    public void setUsua_id(int usua_id) {
        this.usua_id = usua_id;
    }

    
    
    public boolean registrareserva_c(int idusua) {
        String cad = "";
        int id = clases.metodos.generaid("rc_id", "reserva_c", 60000);
        setRc_id(id);
        setRc_estado("pendiente");
        setUsua_id(idusua);
        String consulta = "insert into reserva_c values (" + getRc_id() + ", '" + getRc_estado() + "', " + getUsua_id() + ");";
        boolean reg = clases.metodos.registrar(consulta, getRc_id(), "rc_id", "reserva_c");
        return reg;
    }

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getRc_cod(), "rc_cod", "reserva_c");
        if (datos[0] == null) {
            cad += "<h1>No se encontraron registros</h1>";
        } else {
            for (int i = 0; i < datos.length; i++) {
                cad += " " + datos[i] + " ";
            }
        }
        return datos;
    }

    public boolean modificar() {
        boolean upd=false;
        Object[] datos = {getRc_id(), getRc_cod(), getRc_estado(), getUsua_id()};
        Object[] campos = {"rc_id", "rc_cod", "rc_estado", "usua_id"};
        int actualiza = clases.metodos.modificar(datos, campos, "reserva_c", "rc_id", getRc_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }
}
