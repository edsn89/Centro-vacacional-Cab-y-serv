<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Cabaña</title>
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <jsp:useBean id="objCabania" scope="application" class="clases.cabania" />
            <jsp:setProperty name="objCabania" property="*" />
            
            <jsp:useBean id="objServicio" scope="application" class="clases.servicio" />
            <jsp:setProperty name="objServicio" property="*" />
            
            <jsp:useBean id="objTipCab" scope="application" class="clases.tipocab" />
            <jsp:setProperty name="objTipCab" property="*" />
            
            <%
                String opcion =request.getParameter("opcion");
                String cade="";
                switch(opcion){
                    case "cabania": 
                        cade=objCabania.registrarc();
                        out.print("<div class='respuesta'>"+cade+"</div>");
                        break;
                    case "servicio": 
                        cade=objServicio.registrar();
                        out.print("<div class='respuesta'>"+cade+"</div>");
                        break;
                    case "tipocab": 
                        cade=objTipCab.registrartc();
                        out.print("<div class='respuesta'>"+cade+"</div>");
                        break;
                    
                }
                
                
            %>
    </body>
</html>
