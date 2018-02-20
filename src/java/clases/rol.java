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
public class rol {

    private int rol_id;
    private String rol_descripcion;

    public rol() {
    }

    public rol(int rol_id, String rol_descripcion) {
        this.rol_id = rol_id;
        this.rol_descripcion = rol_descripcion;
    }

    public int getRol_id() {
        return rol_id;
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    public String getRol_descripcion() {
        return rol_descripcion;
    }

    public void setRol_descripcion(String rol_descripcion) {
        this.rol_descripcion = rol_descripcion;
    }

    
    
    public String registrarol() {
        String cad = "";
        int id = clases.metodos.generaid("rol_id", "rol", 70000);
        setRol_id(id);
        String consulta = "insert into rol values (" + getRol_id() + ",'" + getRol_descripcion() + "');";
        boolean reg = clases.metodos.registrar(consulta, getRol_id(), "rol_id", "rol");
        if (reg) {
            cad += "<h1>Se ha registrado con exito</h1>";
        } else {
            cad += "<h1>No Se ha registrado con exito</h1>";
        }
        return cad;
    }

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getRol_descripcion(), "rol_descripcion", "rol");
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
        Object[] datos = {getRol_id(), getRol_descripcion()};
        Object[] campos = {"rol_id", "rol_descripcion"};
        int actualiza = clases.metodos.modificar(datos, campos, "rol", "rol_id", getRol_id());
        if (actualiza != 0) {
            cad += "<h1>Se han modificado los datos correctamente</h1>";
        } else {
            cad += "<h1>No se ha realizado la modificacion</h1>";
        }
        return cad;
    }

}
