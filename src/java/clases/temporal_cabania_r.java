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
public class temporal_cabania_r {

    private int tempcr_id;
    private int usua_id;
    private int usua_cedula;
    private String cr_fechaentrada;
    private String cr_fechasalida;
    private int tc_id;
    private int cr_cantidad;
    private float cr_preciot;

    public temporal_cabania_r() {
    }

    public temporal_cabania_r(int tempcr_id, int usua_id, int usua_cedula, String cr_fechaentrada, String cr_fechasalida, int tc_id, int cr_cantidad, float cr_preciot) {
        this.tempcr_id = tempcr_id;
        this.usua_id = usua_id;
        this.usua_cedula = usua_cedula;
        this.cr_fechaentrada = cr_fechaentrada;
        this.cr_fechasalida = cr_fechasalida;
        this.tc_id = tc_id;
        this.cr_cantidad = cr_cantidad;
        this.cr_preciot = cr_preciot;
    }

    public int getTempcr_id() {
        return tempcr_id;
    }

    public void setTempcr_id(int tempcr_id) {
        this.tempcr_id = tempcr_id;
    }

    public int getUsua_id() {
        return usua_id;
    }

    public void setUsua_id(int usua_id) {
        this.usua_id = usua_id;
    }
    
    
    public int getUsua_cedula() {
        return usua_cedula;
    }

    public void setUsua_cedula(int usua_cedula) {
        this.usua_cedula = usua_cedula;
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

    public int getTc_id() {
        return tc_id;
    }

    public void setTc_id(int tc_id) {
        this.tc_id = tc_id;
    }

    public int getCr_cantidad() {
        return cr_cantidad;
    }

    public void setCr_cantidad(int cr_cantidad) {
        this.cr_cantidad = cr_cantidad;
    }

    public float getCr_preciot() {
        return cr_preciot;
    }

    public void setCr_preciot(float cr_preciot) {
        this.cr_preciot = cr_preciot;
    }

    
    public boolean registratempcab_r() {
        boolean reg = false;
        int id = clases.metodos.generaid("tempcr_id", "temporal_cabania_r", 300);
        setTempcr_id(id);
        float precio=metodos.obtenerundatoF("select tc_precio from tipocab where tc_id="+getTc_id()+";","tc_precio");
        precio=precio*getCr_cantidad();
        setCr_preciot(precio);
        String consulta = "insert into temporal_cabania_r values (" + getTempcr_id()+ ", "+getUsua_id()+", "+getUsua_cedula()+", '" + getCr_fechaentrada() + "', '" + getCr_fechasalida() + "', " + getTc_id() + "," + getCr_cantidad()+ "," + getCr_preciot()+ ");";
        reg = clases.metodos.registrar(consulta, getTempcr_id(), "Tempcr_id", "temporal_cabania_r");
        return reg;
    }
    

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getCr_fechaentrada(), "cr_fechaentrada", "temporal_cabania_r");
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
        Object[] datos = {getTempcr_id(), getUsua_id(), getUsua_cedula() , getCr_fechaentrada(), getCr_fechasalida(), getTc_id(), getCr_cantidad(), getCr_preciot()};
        Object[] campos = {"tempcr_id", "usua_id", "Usua_cedula", "cr_fechaentrada", "cr_fechasalida", "tc_id", "cr_cantidad", "cr_preciot"};
        int actualiza = clases.metodos.modificar(datos, campos, "temporal_cabania_r", "tempcr_id", getTempcr_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }

}
