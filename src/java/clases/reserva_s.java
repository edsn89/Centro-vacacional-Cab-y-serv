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
public class reserva_s {

    private int rs_id;
    private int rs_cod;
    private String rs_estado;
    private int usua_id;

    public reserva_s() {
    }

    public reserva_s(int rs_id, int rs_cod, String rs_estado, int usua_id) {
        this.rs_id = rs_id;
        this.rs_cod = rs_cod;
        this.rs_estado = rs_estado;
        this.usua_id = usua_id;
    }

    public int getRs_id() {
        return rs_id;
    }

    public void setRs_id(int rs_id) {
        this.rs_id = rs_id;
    }

    public int getRs_cod() {
        return rs_cod;
    }

    public void setRs_cod(int rs_cod) {
        this.rs_cod = rs_cod;
    }

    public String getRs_estado() {
        return rs_estado;
    }

    public void setRs_estado(String rs_estado) {
        this.rs_estado = rs_estado;
    }

    public int getUsua_id() {
        return usua_id;
    }

    public void setUsua_id(int usua_id) {
        this.usua_id = usua_id;
    }

    
    

    public boolean registrareserva_s(int idusua) {
        int id = clases.metodos.generaid("rs_id", "reserva_s", 60000);
        setRs_id(id);
        setRs_estado("pendiente");
        setUsua_id(idusua);
        String consulta = "insert into reserva_s values (" + getRs_id() + ", '" + getRs_estado() + "'," + getUsua_id() + ");";
        boolean reg = clases.metodos.registrar(consulta, getRs_id(), "rs_id", "reserva_s");
        return reg;
    }
    
    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getRs_cod(), "rs_cod", "reserva_s");
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
        Object[] datos = {getRs_id(), getRs_cod(), getRs_estado(), getUsua_id()};
        Object[] campos = {"rs_id", "rs_cod", "rs_estado", "usua_id"};
        int actualiza = clases.metodos.modificar(datos, campos, "reserva_s", "rs_id", getRs_id());
        if (actualiza != 0) {
            cad += "<h1>Se han modificado los datos correctamente</h1>";
        } else {
            cad += "<h1>No se ha realizado la modificacion</h1>";
        }
        return cad;
    }

}
