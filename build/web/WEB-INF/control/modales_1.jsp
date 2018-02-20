<%-- 
    Document   : modales.jsp
    Created on : 2/02/2017, 08:40:26 PM
    Author     : Leidy
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Informe de Facturacion</h4>
      </div>
      <div class="modal-body">
          <label>Subtotal de Cabañas Reservadas:</label>
          <input type="text" class="form-control" name="stc" id="stc" disabled>
        <div>
          <label>Subtotal de Servicios Reservadas:</label>
          <input type="text" class="form-control" name="str" id="str" disabled>
      </div>
        <div>
          <label>Total de Reservas:</label><br>
          <input type="text" class="form-control" name="st" id="st" disabled>
      </div>
        <div>
          <label>Fecha de Facturacion:</label><br>
          <input type="text" class="form-control" name="fec" id="fec" disabled>
      </div>
            </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Aceptar</button>
        <!--<button type="button" class="btn btn-primary" onclick="console.log('click al boton save')">Guardar Cambios</button>-->
      </div>
    </div>
  </div>
</div>

          
          