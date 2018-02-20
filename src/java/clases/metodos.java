/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import bd.Conexion;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.util.codec.binary.StringUtils;

/**
 *
 * @author EDSN-PC
 */
public class metodos {

    public static Conexion con = new Conexion("127.0.0.1", "5432", "vmarina", "postgres", "12345");

    public static Object[][] BusquedaInstantanea(Object busqueda, String[] campos, String[] campossel, String tabla) {
        Object[][] datos = null;
        String consulta = "";
        try {
            con.ConexionPostgres();
            String[] caracteres_malos = {"<", ">", "\"", "'", "/", "<", ">", "'", "/"};
            String[] caracteres_buenos = {"&lt;", "&gt;", "&quot;", "&#x27;", "&#x2F;", "&#060;", "&#062;", "&#039;", "&#047;"};
            String busc = "";
            if (campos.length > 0) {
                if (busqueda.getClass().getSimpleName().equals("String")) {
                    busc = busqueda.toString();
                    for (int i = 0; i < caracteres_buenos.length; i++) {
                        busc = busc.replaceAll(caracteres_malos[i], caracteres_buenos[i]);
                    }
                    consulta += "SELECT ";
                    for (int i = 0; i < campossel.length; i++) {
                        consulta += " " + campossel[i] + "";
                        if (i < campossel.length - 1) {
                            consulta += ", ";
                        }
                    }
                    consulta += " FROM " + tabla + " WHERE " + campos[0] + " LIKE '%" + busqueda + "%'";
                    if (campos.length > 1) {
                        for (int i = 1; i < campos.length; i++) {
                            consulta += " OR " + campos[i] + " LIKE '%" + busc + "%' ";
                        }
                    }
                } else {
                    consulta += "SELECT ";
                    for (int i = 0; i < campossel.length; i++) {
                        consulta += " " + campossel[i] + "";
                        if (i < campossel.length - 1) {
                            consulta += ", ";
                        }
                    }
                    consulta += " FROM " + tabla + " WHERE TO_CHAR(" + campos[0] + ", '999999999999999') LIKE '%" + busqueda + "%' ";
                    if (campos.length > 1) {
                        for (int i = 1; i < campos.length; i++) {
                            consulta += " OR TO_CHAR(" + campos[i] + ", '999999999999999') LIKE '%" + busqueda + "%' ";
                        }
                    }
                }
                consulta += ";";
            }

            ResultSet rs = con.consultar(consulta);
            datos = ObtenerRegistros(rs);
            con.cerrar();
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }

    public static int generaid(String campid, String tabla, int inic) {
        int idd = 0;
        try {
            con.ConexionPostgres();
            String consulta = "";
            consulta = "select * from " + tabla + ";";
            ResultSet rs = con.consultar(consulta);
            int cont = con.contar(rs);
            if (cont == 0) {
                idd = inic + 1;
            } else {
                consulta = "select max(" + campid + ") as maxim from " + tabla + ";";
                rs = con.consultar(consulta);
                if (rs.next()) {
                    idd = rs.getInt("maxim") + 1;
                }
            }
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idd;
    }

    public static boolean registrar(String consulta, Object clave, String campid, String tabla) {
        boolean s = false;
        String consult = "";
        try {
            con.ConexionPostgres();
            if (clave.getClass().getSimpleName().equals("String")) {
                consult = "select *  from " + tabla + " where " + campid + "= '" + clave + "';";
            } else {
                consult = "select *  from " + tabla + " where " + campid + "= " + clave + ";";
            }
            ResultSet rs = con.consultar(consult);
            int cont = con.contar(rs);
            if (cont != 0) {
                s = false;
            } else {
                con.actualizar(consulta);
                s = true;
            }
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
    

    public static int sabercantidad(String consulta) {
        int cant = 0;
        try {
            con.ConexionPostgres();
            ResultSet rs = con.consultar(consulta);
            cant = con.contar(rs);
            con.cerrar();
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cant;
    }

    public static Object[] buscar(Object clave, String campo, String tabla) {
        Object[] datos = null;
        try {
            con.ConexionPostgres();
            String consulta = "";
            if (clave.getClass().getSimpleName().equals("String")) {
                consulta = "select *  from " + tabla + " where " + campo + "= '" + clave + "';";
            } else {
                consulta = "select *  from " + tabla + " where " + campo + "= " + clave + ";";
            }
            ResultSet rs = con.consultar(consulta);
            datos = ObtenerUnRegistro(rs);
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }

    
    public static Object[][] ListarTablaG(String consulta) {
        Object[][] tabl = null;
        boolean s = false;
        try {
            con.ConexionPostgres();
            ResultSet rs = con.consultar(consulta);
            tabl = ObtenerRegistros(rs);
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tabl;
    }
    
    public static void Actualizarr(String consulta){
        try {
            con.ConexionPostgres();
            con.actualizar(consulta);
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Object[][] ListarTabla(String campos, String tabla, String campid) {
        Object[][] tabl = null;
        boolean s = false;
        try {
            con.ConexionPostgres();
            String consulta = "select " + campos + "  from " + tabla + " order by " + campid + "";
            ResultSet rs = con.consultar(consulta);
            tabl = ObtenerRegistros(rs);
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tabl;
    }

    public static Object[] ListarCampo(String tabla, String campid) {
        Object[] list = null;
        try {
            con.ConexionPostgres();
            String consulta = "select " + campid + "  from " + tabla + " order by " + campid + "";
            ResultSet rs = con.consultar(consulta);
            list = ObtenerFilasUnDato(rs);
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static int modificar(Object[] datos, Object[] campos, String tabla, String campoP, int datoP) {
        int resp = 0;
        try {
            String consulta = "update " + tabla + " set ";
            for (int i = 0; i < datos.length; i++) {
                if (datos[i].getClass().getSimpleName().equals("String")) {
                    consulta += " " + campos[i] + " = '" + datos[i] + "' ";
                } else {
                    consulta += " " + campos[i] + " = " + datos[i] + " ";
                }
                if (i < datos.length - 1) {
                    consulta += ", ";
                }
            }
            consulta += " where " + campoP + " = " + datoP + ";";
            con.ConexionPostgres();
            resp = con.actualizar1(consulta);
            con.cerrar();
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }

    public static int InsertarBloque(Object[][] datos, String tabla) {
        int resp = 0;
        String consulta = "";
        try {
            consulta += "insert into " + tabla + " values ";
            for (int i = 0; i < datos.length; i++) {
                consulta += "(";
                for (int j = 0; j < datos[i].length; j++) {
                    if (datos[i][j].getClass().getSimpleName().equals("String")) {
                        consulta += " '" + datos[i][j] + "' ";
                    } else {
                        consulta += " " + datos[i][j] + " ";
                    }
                    if (j < datos[i].length - 1) {
                        consulta += ", ";
                    }
                }
                consulta += ") ";
                if (i < datos.length - 1) {
                    consulta += ", ";
                }
            }
            consulta += ";";
            con.ConexionPostgres();
            resp = con.actualizar1(consulta);
            con.cerrar();
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }

    public static float obtenerundatoF(String consulta, String campoPrecio) {
        float precio = 0;
        try {
            con.ConexionPostgres();
            ResultSet rs = con.consultar(consulta);
            if (rs.next()) {
                precio = rs.getFloat("" + campoPrecio + "");
            }
            con.cerrar();
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return precio;
    }
    
    public static int obtenerundatoInt(String consulta, String campoPrecio) {
        int dato = 0;
        try {
            con.ConexionPostgres();
            ResultSet rs = con.consultar(consulta);
            if (rs.next()) {
                dato = rs.getInt("" + campoPrecio + "");
            }
            con.cerrar();
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }

    public static int saberid(String consulta, String campoid) {
        int id = 0;
        try {
            con.ConexionPostgres();
            ResultSet rs = con.consultar(consulta);
            if (rs.next()) {
                id = rs.getInt("" + campoid + "");
            }
            con.cerrar();
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static Object[][] ObtenerRegistros(ResultSet rs) {
        Object obj[][] = null;
        try {
            rs.last(); //se posiciona en el ultimo registro del rs
            ResultSetMetaData rsmd = rs.getMetaData();
            int numCols = rsmd.getColumnCount();
            int numFils = rs.getRow() + 1;
            obj = new Object[numFils][numCols];
            int j = 1;
            int x = 0;
            rs.beforeFirst();//se posiciona antes del primer registro del rs
            for (int i = 1; i <= numCols; i++) {
                obj[0][x] = rsmd.getColumnName(i);
                x++;
            }
            while (rs.next()) {
                for (int i = 0; i < numCols; i++) {
                    obj[j][i] = rs.getObject(i + 1);
                }
                j++;
            }
        } catch (Exception e) {
        }
        return obj;
    }

    public static Object[] ObtenerUnRegistro(ResultSet rs) {
        Object obj[] = null;
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            int numCols = rsmd.getColumnCount();
            obj = new Object[numCols];
            while (rs.next()) {
                for (int i = 0; i < numCols; i++) {
                    obj[i] = rs.getObject(i + 1);
                }
            }
        } catch (Exception e) {
        }
        return obj;
    }

    public static Object[] ObtenerFilasUnDato(ResultSet rs) {
        Object obj[] = null;
        try {
            rs.last(); //se posiciona en el ultimo registro del rs
            int numFils = rs.getRow() + 1;
            obj = new Object[numFils];
            rs.beforeFirst();//se posiciona antes del primer registro del rs
            while (rs.next()) {
                for (int i = 0; i < numFils; i++) {
                    obj[i] = rs.getObject(i + 1);
                }
            }
        } catch (Exception e) {
        }
        return obj;
    }
    
    public static String ListarResSer() {
        Object[][] datos = null;
        boolean s = false;
        String cade ="";
        try {
            con.ConexionPostgres();
            String consulta = "select rs.rs_id, rs.rs_estado,rs.usua_id, sr.serv_id from reserva_s rs, servicio_r sr where rs.rs_id=sr.rs_id and rs.rs_estado='pendiente';";
            ResultSet rs = con.consultar(consulta);
            datos = ObtenerRegistros(rs);
            
        cade += "<thead>"
                + "<tr><th>Id reserva servicio</th>"
                + "<th>Estado</th>"
                + "<th>Usuario</th>"
                + "<th>Servicio</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "</tr>";
        }
        cade += "</tbody>";
       
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cade;
    }
          public static String ListarResCab() {
        Object[][] datos = null;
        boolean s = false;
        String cade ="";
        try {
            con.ConexionPostgres();
            String consulta = "select rc.rc_id, rc.rc_estado,rc.usua_id, cr.cab_id "
                    + " from reserva_c rc, cabania_r cr where rc.rc_id=cr.rc_id and rc.rc_estado='pendiente';";
            ResultSet rs = con.consultar(consulta);
            datos = ObtenerRegistros(rs);
            
        cade += "<thead>"
                + "<tr><th>Id reserva cabaña</th>"
                + "<th>Estado</th>"
                + "<th>Usuario</th>"
                + "<th>Numero Cabaña</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "</tr>";
        }
        cade += "</tbody>";
       
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cade;
    }
        public static String ListarCabDis() {
        Object[][] datos = null;
        boolean s = false;
        String cade ="";
        try {
            con.ConexionPostgres();
            String consulta = "select cab.cab_id, cab.cab_numero, cab.cab_estado,tc.tc_nombre "
                    + "from cabania cab, tipocab tc where cab.tc_id=tc.tc_id and cab_estado = 'disponible';";
            ResultSet rs = con.consultar(consulta);
            datos = ObtenerRegistros(rs);
            
        cade += "<thead>"
                + "<tr><th>Id de cabaña</th>"
                + "<th>Numero de cabaña</th>"
                + "<th>Estado</th>"
                + "<th>Tipo de cabaña</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "</tr>";
        }
        cade += "</tbody>";
       
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cade;
    }
         public static String ListarFacturas(String dte1, String dte2) {
        Object[][] datos = null;
        boolean s = false;
        String cade ="";
        try {
            con.ConexionPostgres();
            String consulta = "select * from factura where fac_fecha between '"+dte1+"' and '"+dte2+"'; ";
            ResultSet rs = con.consultar(consulta);
            datos = ObtenerRegistros(rs);
            
        cade += "<thead>"
                + "<tr><th>Id de factura</th>"
                + "<th>Fecha factura</th>"
                + "<th>Precio</th>"
                + "<th>Id reserva cabaña</th>"
                + "<th>Id reserva servicio</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "</tr>";
        }
        cade += "</tbody>";
       
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cade;
    }
         public static String ListarCabTipo(int dte1) {
        Object[][] datos = null;
        boolean s = false;
        String cade ="";
        try {
            con.ConexionPostgres();
          //"select * from factura where fac_fecha between '"+dte1+"' and '"+dte2+"'; ";
              String consulta = "select *  from cabania c where c.cab_estado='disponible'  and  c.tc_id='"+dte1+"';";
            ResultSet rs = con.consultar(consulta);
            datos = ObtenerRegistros(rs);
            
        cade += "<thead>"
                + "<tr><th>Id de cabaña</th>"
                + "<th>Numero de cabaña</th>"
                + "<th>Estado</th>"
                + "<th>Id tipo cabaña</th>"
                + "</tr></thead>"
                + "<tbody>";
        for (int i = 1; i < datos.length; i++) {
            cade += "<tr>";
            for (int j = 0; j < datos[i].length; j++) {
                cade += "<td>"+datos[i][j]+"</td>";
            }
            cade += "</tr>";
        }
        cade += "</tbody>";
            con.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(metodos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cade;
    }

}
