
create or replace function Insertarfactur(idu numeric,ids numeric, idc numeric)
returns varchar as $$
declare 
		totalc numeric;
		totals numeric;
		total numeric;
		fechaf date;
		conse numeric;
		fact_id numeric;
		cadena varchar;
begin 

 	select count(*) into conse from factura;
 	if conse = 0 then
		fact_id:=86001;
	else
		select max(fac_id)+1  into fact_id from factura;
		-- fact_id:=fact_id+1; 
	end if;
 	
        select coalesce(tc.tc_precio,0) as pc  into totalc from  reserva_c rc , cabania_r cr, cabania c, tipocab tc where rc.rc_id=cr.rc_id and cr.cab_id=c.cab_id and c.tc_id=tc.tc_id and rc.rc_estado='pendiente' and rc.usua_id= $1;
        select coalesce(sum(sr.sr_preciot),0) as ps  into totals from  servicio_r sr, reserva_s rs where rs.rs_id=sr.rs_id and rs.usua_id= $1;
        fechaf:= now();
	total:= (totalc + totals);
	INSERT INTO factura(fac_id, fac_fecha, fac_precio, rc_id, rs_id) VALUES (fact_id,fechaf,total,$3,$2);
	cadena:='Su factura se inserto con exito,'|| fact_id||','||totalc||','||totals;

return cadena;
end;
$$
language plpgsql;
















create or replace function Insertarfactur(idu numeric,ids numeric, idc numeric)
returns varchar as $$
declare 
		totalc numeric;
		totals numeric;
		total numeric;
		fechaf date;
		conse numeric;
		fact_id numeric;
		cadena varchar;
begin 

 	select count(*) into conse from factura;
 	if conse = 0 then
		fact_id:=86001;
	else
		select max(fac_id)+1  into fact_id from factura;
		-- fact_id:=fact_id+1; 
	end if;
 	
        select coalesce(sum(cr.cr_precio_t),0) as pc into totalc from  cabania_r cr, reserva_c rc where rc.rc_id=cr.rc_id and rc.usua_id= $1;
        select coalesce(sum(sr.sr_precio_t),0) as ps  into totals from  servicio_r sr, reserva_s rs where rs.rs_id=sr.rs_id and rs.usua_id= $1;
        fechaf:= now();
	total:= (totalc + totals);
	INSERT INTO factura(fac_id, fac_fecha, fac_precio, rc_id, rs_id) VALUES (fact_id,fechaf,total,$3,$2);
	cadena:='Su factura se inserto con exito'|| fact_id;

return cadena;
end;
$$
language plpgsql;
.---------------------
