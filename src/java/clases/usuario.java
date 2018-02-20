/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import bd.Conexion;
import static clases.metodos.*;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class usuario {

    private int usua_id;
    private int usua_cedula;
    private String usua_primernombre;
    private String usua_segundonombre;
    private String usua_primerapellido;
    private String usua_segundoapellido;
    private String usua_telefono;
    private String usua_direccion;
    private String usua_fechanacimiento;
    public static String usua_usuario;
    public static String usua_clave;

    public static boolean loggedIn = false;
    
    public usuario() {
    }

    public usuario(int usua_id, int usua_cedula, String usua_primernombre, String usua_segundonombre, String usua_primerapellido, String usua_segundoapellido, String usua_telefono, String usua_direccion, String usua_fechanacimiento, String usua_usuario, String usua_clave) {
        this.usua_id = usua_id;
        this.usua_cedula = usua_cedula;
        this.usua_primernombre = usua_primernombre;
        this.usua_segundonombre = usua_segundonombre;
        this.usua_primerapellido = usua_primerapellido;
        this.usua_segundoapellido = usua_segundoapellido;
        this.usua_telefono = usua_telefono;
        this.usua_direccion = usua_direccion;
        this.usua_fechanacimiento = usua_fechanacimiento;
        this.usua_usuario = usua_usuario;
        this.usua_clave = usua_clave;
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

    public String getUsua_primernombre() {
        return usua_primernombre;
    }

    public void setUsua_primernombre(String usua_primernombre) {
        this.usua_primernombre = usua_primernombre;
    }

    public String getUsua_segundonombre() {
        return usua_segundonombre;
    }

    public void setUsua_segundonombre(String usua_segundonombre) {
        this.usua_segundonombre = usua_segundonombre;
    }

    public String getUsua_primerapellido() {
        return usua_primerapellido;
    }

    public void setUsua_primerapellido(String usua_primerapellido) {
        this.usua_primerapellido = usua_primerapellido;
    }

    public String getUsua_segundoapellido() {
        return usua_segundoapellido;
    }

    public void setUsua_segundoapellido(String usua_segundoapellido) {
        this.usua_segundoapellido = usua_segundoapellido;
    }

    public String getUsua_telefono() {
        return usua_telefono;
    }

    public void setUsua_telefono(String usua_telefono) {
        this.usua_telefono = usua_telefono;
    }

    public String getUsua_direccion() {
        return usua_direccion;
    }

    public void setUsua_direccion(String usua_direccion) {
        this.usua_direccion = usua_direccion;
    }

    public String getUsua_fechanacimiento() {
        return usua_fechanacimiento;
    }

    public void setUsua_fechanacimiento(String usua_fechanacimiento) {
        this.usua_fechanacimiento = usua_fechanacimiento;
    }

    public String getUsua_usuario() {
        return usua_usuario;
    }

    public void setUsua_usuario(String usua_usuario) {
        this.usua_usuario = usua_usuario;
    }

    public String getUsua_clave() {
        return usua_clave;
    }

    public void setUsua_clave(String usua_clave) {
        this.usua_clave = usua_clave;
    }
    
    public static boolean isLoggedIn() {
        return loggedIn;
    }

    public void logOut() {
        this.loggedIn = false;
    }
    public boolean login() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {

        con.ConexionPostgres();
        String consult = "select usua_id as id, usua_cedula as cd, usua_primernombre as un, usua_primerapellido as up from usuarios where usua_usuario ='" + usua_usuario + "' and usua_clave='" + usua_clave + "';";
        ResultSet rs = con.consultar(consult);
        if (rs.next()) {
            int usua=rs.getInt("id");
            int cdla=rs.getInt("cd");
            String nombre = rs.getString("un");
            String apellido = rs.getString("up");
            this.setUsua_id(usua);
            this.setUsua_cedula(cdla);
            this.setUsua_primernombre(nombre);
            this.setUsua_primerapellido(apellido);
            loggedIn = true;
        } else {
            loggedIn = false;
        }

        con.cerrar();
        return loggedIn;
    }
    
    

    public boolean registrausua() {
        boolean reg = false;
        int id = metodos.generaid("usua_id", "usuarios", 10000);
        setUsua_id(id);
        String consulta = "insert into usuarios values (" + getUsua_id() + "," + getUsua_cedula() + ",'" + getUsua_primernombre() + "','" + getUsua_segundonombre() + "','" + getUsua_primerapellido() + "','" + getUsua_segundoapellido()
                + "','" + getUsua_telefono() + "','" + getUsua_direccion() + "','" + getUsua_fechanacimiento() + "','" + getUsua_usuario() + "','" + getUsua_clave() + "');";
        reg = metodos.registrar(consulta, getUsua_cedula(), "usua_cedula", "usuarios");
        return reg;
    }
    
    

    public Object[] buscar() {
        Object[] datos = metodos.buscar(getUsua_cedula(), "usua_cedula", "usuarios");
        
        this.setUsua_id(Integer.parseInt(datos[0].toString()));
        this.setUsua_cedula(Integer.parseInt(datos[1].toString()));
        this.setUsua_primernombre(datos[2].toString());
        this.setUsua_segundonombre(datos[3].toString());
        this.setUsua_primerapellido(datos[4].toString());
        this.setUsua_segundoapellido(datos[5].toString());
        this.setUsua_telefono(datos[6].toString());
        this.setUsua_direccion(datos[7].toString());
        this.setUsua_fechanacimiento(datos[8].toString());
        this.setUsua_usuario(datos[9].toString());
        this.setUsua_clave(datos[10].toString());
        return datos;
    }
    
    public Object[] buscarid() {
        Object[] datos = metodos.buscar(getUsua_id(), "usua_id", "usuarios");
        this.setUsua_id(Integer.parseInt(datos[0].toString()));
        this.setUsua_cedula(Integer.parseInt(datos[1].toString()));
        this.setUsua_primernombre(datos[2].toString());
        this.setUsua_segundonombre(datos[3].toString());
        this.setUsua_primerapellido(datos[4].toString());
        this.setUsua_segundoapellido(datos[5].toString());
        this.setUsua_telefono(datos[6].toString());
        this.setUsua_direccion(datos[7].toString());
        this.setUsua_fechanacimiento(datos[8].toString());
        this.setUsua_usuario(datos[9].toString());
        this.setUsua_clave(datos[10].toString());
        return datos;
    }

    public boolean modificar() {
        boolean upd=false;
        Object[] datos = {getUsua_id(), getUsua_cedula(), getUsua_primernombre(), getUsua_segundonombre(), getUsua_primerapellido(),
            getUsua_segundoapellido(), getUsua_telefono(), getUsua_direccion(), getUsua_fechanacimiento(),
            getUsua_usuario(), getUsua_clave()};
        Object[] campos = {"usua_id", "usua_cedula", "usua_primernombre", "usua_segundonombre", "usua_primerapellido",
            "usua_segundoapellido", "usua_telefono", "usua_direccion", "usua_fechanacimiento", "usua_usuario", "usua_clave"};
        int actualiza = clases.metodos.modificar(datos, campos, "usuarios", "usua_id", getUsua_id());
        if (actualiza != 0) {
            upd=true;
        } else {
            upd=false;
        }
        return upd;
    }
    
    public String listSelectusua() {
        Object[][] datos = metodos.ListarTabla("usua_cedula, usua_primernombre, usua_primerapellido", "usuarios", "usua_primernombre");
        String cade = "";
        for (int i = 1; i < datos.length; i++) {
            for (int j = 0; j < datos[i].length; j = j + 3) {
                cade += "<option value='" + datos[i][j] + "'>" + datos[i][j + 1] + " "+datos[i][j + 2]+"   Cedula: "+datos[i][j]+"</option>";
            }
        }
        return cade;
    }
    
    public String Construyebusqueda(Object busqueda){
        String[] camposbusc={"usua_cedula"};
        String[] camposselect={"usua_id", "usua_cedula", "usua_primernombre", "usua_primerapellido"};
        Object[][] datos = metodos.BusquedaInstantanea(busqueda, camposbusc, camposselect, "usuarios");
        String cade ="";
        cade += "<table class='table table-bordered table-hover'>"
                + "<thead>"
                + "<tr><th>Id Usuario</th>"
                + "<th>Cedula del Usuario</th>"
                + "<th>Primer Nombre</th>"
                + "<th>Primer apellido</th>"
                + "<th>seleccion</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            this.setUsua_id(Integer.parseInt(datos[i][0].toString()));
            this.setUsua_cedula(Integer.parseInt(datos[i][1].toString()));
            this.setUsua_primernombre(datos[i][2].toString());
            this.setUsua_primernombre(datos[i][3].toString());
            cade += "<td> <center><input name='radio_id' id='radio_id"+i+"' value="+getUsua_id()+" type='radio'></center></td></tr>";
            
        }
        cade += "</tbody>"
                + "</table>";
        return cade;
    }
    
    public String Tablausua() {
        Object[][] datos = metodos.ListarTabla("usua_id, usua_cedula, usua_primernombre, usua_primerapellido, usua_telefono, usua_direccion", "usuarios", "usua_primernombre");
        String cade ="";
        cade += "<thead>"
                + "<tr><th>Id Usuario</th>"
                + "<th>Cedula del Usuario</th>"
                + "<th>Primer Nombre</th>"
                + "<th>Primer apellido</th>"
                + "<th>Telefono</th>"
                + "<th>Direccion</th>"
                + "<th>Elimina</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "<td style=\"width:80px;\"> <a href=\"\" class=\"btn btn-danger btn-xs\">Eliminar</a></td></tr>";
        }
        cade += "</tbody>";
        return cade;
    }


}
