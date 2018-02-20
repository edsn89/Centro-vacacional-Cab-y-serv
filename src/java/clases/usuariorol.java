/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import static clases.metodos.con;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class usuariorol {

    private int usrol_id;
    private int rol_id;
    private int usua_id;

    public usuariorol() {
    }

    public usuariorol(int usrol_id, int rol_id, int usua_id) {
        this.usrol_id = usrol_id;
        this.rol_id = rol_id;
        this.usua_id = usua_id;
    }

    public int getUsrol_id() {
        return usrol_id;
    }

    public void setUsrol_id(int usrol_id) {
        this.usrol_id = usrol_id;
    }

    public int getRol_id() {
        return rol_id;
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    public int getUsua_id() {
        return usua_id;
    }

    public void setUsua_id(int usua_id) {
        this.usua_id = usua_id;
    }


    public int obtenerRol(int id){
      int idd=0;
        try {
            
            String consulta="select rol_id from usuariorol where usua_id = "+id+";";
            
            con.ConexionPostgres();
            ResultSet rs = con.consultar(consulta);
            if (rs.next()) {
                idd=rs.getInt("rol_id");
                this.setRol_id(idd);
                System.out.println("rolid "+idd);
            }
            con.cerrar();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(usuariorol.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(usuariorol.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(usuariorol.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(usuariorol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idd;
    }

    public String registrausuarol() {
        String cad = "";
        int id = clases.metodos.generaid("usrol_id", "usuariorol", 100000);
        setUsrol_id(id);
        String consulta = "insert into usuariorol values (" + getUsrol_id() + "," + getRol_id() + "," + getUsua_id() + ");";
        boolean reg = clases.metodos.registrar(consulta, getUsrol_id(), "usrol_id", "usuariorol");
        if (reg) {
            cad += "<h1>Se ha registrado con exito</h1>";
        } else {
            cad += "<h1>No Se ha registrado con exito</h1>";
        }
        return cad;
    }

    public Object[] buscar() {
        String cad = "";
        Object[] datos = clases.metodos.buscar(getUsrol_id(), "usrol_id", "usuariorol");
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
        Object[] datos = {getUsrol_id(), getUsrol_id(), getUsua_id()};
        Object[] campos = {"usrol_id", "rol_id", "usua_id"};
        int actualiza = clases.metodos.modificar(datos, campos, "usuariorol", "usrol_id", getUsrol_id());
        if (actualiza != 0) {
            cad += "<h1>Se han modificado los datos correctamente</h1>";
        } else {
            cad += "<h1>No se ha realizado la modificacion</h1>";
        }
        return cad;
    }

}
