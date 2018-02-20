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
public class temporal_servicio_r {

    private int tempsr_id;
    private int usua_id;
    private int usua_cedula;
    private int serv_id;
    private String sr_fecha;
    private int sr_cantidad;
    private float sr_preciot;

    public temporal_servicio_r() {
    }

    public temporal_servicio_r(int tempsr_id, int usua_id, int usua_cedula, int serv_id, String sr_fecha, int sr_cantidad, float sr_preciot) {
        this.tempsr_id = tempsr_id;
        this.usua_id=usua_id;
        this.usua_cedula = usua_cedula;
        this.serv_id = serv_id;
        this.sr_fecha = sr_fecha;
        this.sr_cantidad = sr_cantidad;
        this.sr_preciot = sr_preciot;
    }

    public int getTempsr_id() {
        return tempsr_id;
    }

    public void setTempsr_id(int tempsr_id) {
        this.tempsr_id = tempsr_id;
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

    public int getServ_id() {
        return serv_id;
    }

    public void setServ_id(int serv_id) {
        this.serv_id = serv_id;
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

    public float getSr_preciot() {
        return sr_preciot;
    }

    public void setSr_preciot(float sr_preciot) {
        this.sr_preciot = sr_preciot;
    }

    
    
    public boolean registratempserv_r() {
        boolean reg = false;
        int id = clases.metodos.generaid("tempsr_id", "temporal_servicio_r", 300);
        setTempsr_id(id);
        float precio=metodos.obtenerundatoF("select serv_precio from servicio where serv_id="+getServ_id()+";","serv_precio");
        precio=precio*getSr_cantidad();
        setSr_preciot(precio);
        String consulta = "insert into temporal_servicio_r values (" + getTempsr_id()+ ", "+getUsua_id()+", "+getUsua_cedula()+", " + getServ_id() + ", '"+ getSr_fecha() + "', "+ getSr_cantidad()+ "," + getSr_preciot()+ ");";
        reg = clases.metodos.registrar(consulta, getTempsr_id(), "Tempsr_id", "temporal_servicio_r");
        return reg;
    }
    

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getSr_fecha(), "sr_fecha", "temporal_servicio_r");
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
        Object[] datos = {getTempsr_id(), getUsua_id(), getUsua_cedula(), getServ_id() , getSr_fecha(),   getSr_cantidad(), getSr_preciot()};
        Object[] campos = {"tempsr_id", "usua_id", "usua_cedula", "serv_id", "sr_fecha",  "cr_cantidad", "cr_preciot"};
        int actualiza = clases.metodos.modificar(datos, campos, "temporal_servicio_r", "tempcr_id", getTempsr_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }
    

}
