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
public class descuento {

    private int desc_id;
    private String desc_nombre;
    private String desc_tipo;
    private int desc_porcentaje;

    public descuento() {
    }

    public descuento(int desc_id, String desc_nombre, String desc_tipo, int desc_porcentaje) {
        this.desc_id = desc_id;
        this.desc_nombre = desc_nombre;
        this.desc_tipo = desc_tipo;
        this.desc_porcentaje = desc_porcentaje;
    }

    public int getDesc_id() {
        return desc_id;
    }

    public void setDesc_id(int desc_id) {
        this.desc_id = desc_id;
    }

    public String getDesc_nombre() {
        return desc_nombre;
    }

    public void setDesc_nombre(String desc_nombre) {
        this.desc_nombre = desc_nombre;
    }

    public String getDesc_tipo() {
        return desc_tipo;
    }

    public void setDesc_tipo(String desc_tipo) {
        this.desc_tipo = desc_tipo;
    }

    public int getDesc_porcentaje() {
        return desc_porcentaje;
    }

    public void setDesc_porcentaje(int desc_porcentaje) {
        this.desc_porcentaje = desc_porcentaje;
    }

    
    public String registradesc() {
        String cad = "";
        int id = clases.metodos.generaid("desc_id", "descuento", 40000);
        setDesc_id(id);
        String consulta = "insert into descuento values (" + getDesc_id() + ",'" + getDesc_nombre() + "','" + getDesc_tipo() + "'," + getDesc_porcentaje() + ");";
        boolean reg = clases.metodos.registrar(consulta, getDesc_id(), "desc_id", "descuento");
        if (reg) {
            cad += "<h1>Se ha registrado con exito</h1>";
        } else {
            cad += "<h1>No Se ha registrado con exito</h1>";
        }
        return cad;
    }

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getDesc_nombre(), "desc_nombre", "descuento");
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
        Object[] datos = {getDesc_id(), getDesc_id(), getDesc_tipo(), getDesc_porcentaje()};
        Object[] campos = {"desc_id", "desc_nombre", "desc_tipo", "desc_porcentaje"};
        int actualiza = clases.metodos.modificar(datos, campos, "porcentaje", "desc_id", getDesc_id());
        if (actualiza != 0) {
            cad += "<h1>Se han modificado los datos correctamente</h1>";
        } else {
            cad += "<h1>No se ha realizado la modificacion</h1>";
        }
        return cad;
    }

}
