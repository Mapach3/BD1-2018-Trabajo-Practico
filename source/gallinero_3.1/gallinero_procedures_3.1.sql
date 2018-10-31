/**********STORED PROCEDURES TP CUATRIMESTRAL**********/

/*============================ STORED PROCEDURES===============================*/
/*================================----ALTA---==================================*/


/*Alta Provincias*/
DELIMITER $$
create procedure Alta_Provincia(IN _idProv int,IN _Nombre varchar(45))
begin
	insert into Provincia values(_Nombre,_idProv);
end$$
delimiter ;

#FUNCIONA


/*Alta prov_has_localid*/
DELIMITER $$
create procedure Alta_Prov_has_localidad(IN _idProv int,IN idLocalidad int)
begin
	insert into provincia_has_localidad values(_idProv,idLocalidad);
end$$
delimiter ;



/*Alta Localidad*/
DELIMITER $$
create procedure Alta_Localidad(IN NombreLoc varchar(45),IN idLocalidad int)
begin
	insert into localidad values(NombreLoc,idLocalidad);
end$$
delimiter ;
# call alta_localidad("Burzaco",1);
# FUNCIONA



/*Alta calle_has_localid*/
DELIMITER $$
create procedure Alta_Calle_has_localidad(IN _idCalle int,IN idLocalidad int)
begin
	insert into calle_has_localidad values(_idCalle,idLocalidad);
end$$

delimiter ;
#FUNCIONA


/*Alta calle*/
DELIMITER $$
create procedure Alta_Calle(IN _nomCalle varchar(45),IN _idCalle int)
begin
	insert into Calle values(_nomCalle,_idCalle);
end$$
delimiter ;
# call alta_calle("Baso",1);
# funciona

/*ALTA Clientes*/
delimiter $$
CREATE PROCEDURE Alta_clientes(IN _Nombre varchar(45),IN _Cuit varchar(45),IN _numDom int, _Calle varchar(45))
begin
	insert into clientes values(_Nombre,_Cuit,_numDom,_Calle);
end$$
delimiter ;
#FUNCIONA
#call alta_clientes(null,"22",2,1);


/*ALTA Cabañas*/
delimiter $$
create procedure Alta_cabaña(IN _RazonSocial varchar(45),IN _idCab int ,IN _Cuit varchar(45),IN _numDom int,IN _Calle varchar(45))
begin
	insert into cabaña values(_RazonSocial,_idCab,_Cuit,_numDom,_Calle);
end $$
delimiter ;
#funciona

/*ALTA Genetica*/
delimiter $$
create procedure Alta_Genetica(IN _Codigo int,IN _Nombre varchar(45),IN _idCabaña int)
begin
	insert into genetica values(_Codigo,_Nombre,_idCabaña);
end$$
delimiter ;
#funciona



/*ALTA Plantel*/
delimiter $$
create procedure Alta_Plantel(IN _Codigo int,IN _Nombre varchar(45), IN _EdadGallinas int,IN _FechaEntrada date,IN _PrecioCompra INT,IN _CodGenetica int)
begin
	insert into Plantel values(_Codigo,_Nombre,_EdadGallinas,_FechaEntrada,_PrecioCompra,_CodGenetica);
end$$
delimiter ;
#funciona


/*ALTA Plantel_tien_Galpon*/
delimiter $$
create procedure Alta_Plantel_Tiene_Galpon(IN _codPlantel int,IN _numGalpon int)
begin
	insert into Plantel_Tiene_Galpon values(_codPlantel,_numGalpon);
end$$
delimiter ;
#funciona


/*ALTA Galpon*/
DELIMITER $$
CREATE PROCEDURE Alta_Galpon(IN _Numero int,IN _ctdGallinas int)
begin
	insert into galpon values(_Numero,_ctdGallinas);
end$$
delimiter ;
#funciona


/*Alta Planilla v3.0*/
delimiter $$
create procedure Alta_Planilla (IN _numGalpon int,IN _Fecha date,IN _ctdHuevos int,IN _ctdAlimento int, IN _tipoAlimento varchar(45),IN _ctdMuertas int,IN _Novedad text)
begin
	insert into Planilla values(_numGalpon,_Fecha,_ctdHuevos,_ctdAlimento,_tipoAlimento,_ctdMuertas,_Novedad,current_user(),now());
end$$
delimiter ;
#funciona




/*Alta Empaque*/
delimiter $$
create procedure Alta_Empaque(IN _idEmpaque int,IN _Descripcion varchar(45),IN _ctdHuevos int)
begin
	insert into Empaque values(_IdEmpaque,_Descripcion,_ctdHuevos);
end$$
delimiter ;
#funciona



/*Alta Productos*/
delimiter $$
create procedure Alta_Productos(IN _CodigoProd int,IN _PrecioVenta int,IN idEmpaque int)
begin
	insert into Productos values(_Codigoprod,_PrecioVenta,idEmpaque);
end$$
delimiter ;
#funciona


/*Alta factura*/
delimiter $$
create procedure Alta_Factura(IN _idFactura int,IN cuit_Cliente varchar(45),IN _FechaVenta date)
begin
	insert into Factura values(_idFactura,cuit_Cliente,_FechaVenta);
end$$
delimiter ;
#funciona

/*Alta Detalle_Factura*/
delimiter $$
create procedure Alta_Detalle_Factura(IN idFactura int,IN codProd int,IN cantProd int,IN _Precio int )
begin
	insert into Detalle_Factura values(idFactura,codProd,cantProd,_Precio);
end$$
delimiter ;


/*Alta Usuarios*/
delimiter $$
create procedure Alta_Usuarios(IN _Nomb varchar(20),IN _Apellido varchar(20),IN _Legajo varchar(20), _Cuil varchar(25), _User varchar(24), _Pass varchar(20))
begin
	insert into Usuarios values(_Nomb,_Apellido,_Legajo,_Cuil,_User,_Pass);
end$$
delimiter ;



/*========================================= STORED PROCEDURES===============================*/
/*=========================================----MODIFICACION---==============================*/


/*Modificacion provincia*/
delimiter $$
create procedure Modificacion_Provincia(IN idInicial int, IN _Nombre varchar(45),IN _idProv int)
begin
	update Provincia set Nombre=_Nombre, idProv=_idProv
    where idProv=idInicial;
end$$
delimiter ;
#FUNCIONA 


/*Modificacion prov_has_localidad*/
delimiter $$
create procedure Modificacion_Prov_Has_loc(IN codLocalidad_orig int,IN codProv_orig int,IN codLocalidad_nuevo int,IN codProv_nuevo int) 
begin
	update provincia_has_localidad set Localidad_idLocalidad=codLocalidad_nuevo,Provincia_idProv=codProv_nuevo
    where Provincia_idProv=codProv_orig and Localidad_idLocalidad=codLocalidad_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Localidad*/
delimiter $$
create procedure Modificacion_Localidad(IN idLoc_orig int,IN idLoc_nuevo int,IN nomLoc varchar(45))
begin
	update Localidad set idLocalidad=idLoc_nuevo,Nombre=nomLoc
    where idLocalidad=idLoc_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Calle*/
delimiter $$
create procedure Modifcacion_Calle(IN idCalle_orig int,in idCalle_nuevo int,in nomCalle varchar(45))
begin
	update Calle set Nombre=nomCalle,idCalle=idCalle_nuevo
    where idCalle=idCalle_orig;
end $$
delimiter ;
#FUNCIONA


 /*Modifcacion Calle_has_Localidad*/
delimiter $$
create procedure Modificacion_Calle_has_localidad(IN idLoc_orig int,IN idCalle_orig int ,in idCalle_nueva int,in idLoc_nuevo int)
begin
	update Calle_Has_Localidad set Calle_idCalle=idCalle_nueva,Localidad_idLocalidad=idLoc_nuevo
    where Calle_idCalle=idCalle_orig and Localidad_idLocalidad=idLoc_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Clientes*/
delimiter $$
create procedure Modificacion_Clientes(IN cuit_orig int,IN _Nombre varchar(45),IN _Cuit varchar(45),IN _numDom int,IN idCalle int) 
begin
	update Clientes set Nombre=_Nombre,Cuit=_Cuit,num_Dom=_numDom,Calle_idCalle=idCalle
    where Cuit=cuit_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Factura*/
delimiter $$
create procedure Modificacion_Factura(IN idFact_Orig int,IN idFact int,IN _Cuit varchar(45),IN _fechaVenta date)
begin
	update Factura set idFactura=idFact,Clientes_Cuit=_Cuit,Fecha_Venta=_fechaVenta
    where Factura.idFactura=idFact_Orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion detalle factura*/
delimiter $$
create procedure Modificacion_Detalle_Factura(IN idFact int,IN idProd_orig int,IN idFact_nuevo int,IN idProd_nuevo int,IN cant int,IN _precio int)
begin
	update Detalle_Factura set Productos_Codigo_prod=idProd_nuevo,Cantidad_prod=cant,Precio=_precio,Factura_IdFactura=idFact_nuevo
    where Detalle_Factura.Factura_IdFactura=idFact and Detalle_Factura.Factura_Productos_Codigo_prod=idProd_orig;
end$$
delimiter ;
#Funciona


/*Modificacion productos*/
delimiter $$
create procedure Modificacion_Productos(IN idProd_orig int,IN idProd_nuevo int,IN precioVenta int,IN idEmpaque int)
begin
	update Productos set Codigo_Prod=idProd_nuevo,Precio_Venta=precioVenta,Empaque_idEmpaque=idEmpaque
    where Productos.Codigo_Prod=idProd_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion empaque*/
delimiter $$
create procedure Modificacion_Empaque(IN _idEmpaque_orig int,IN _idEmpaque_nuevo int,IN _DescripEmpaque varchar(45),IN _ctdHuevos int)
begin
	update Empaque set idEmpaque=_idEmpaque_nuevo,Descripcion=_DescripEmpaque,Ctdad_Huevos=_ctdHuevos
    where Empaque.idEmpaque=_idEmpaque_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Cabaña*/
delimiter $$
create procedure Modificacion_Cabaña(IN idCab_orig int,IN _RazonSocial varchar(45), IN idCab_nuevo int,IN _Cuit varchar(45),IN _NumDom int,IN idCalle int)
begin
	update Cabaña set Razon_Social=_RazonSocial,id_Cabaña=idCab_nuevo,Cuit=_Cuit,Num_Dom=_NumDom,Calle_idCalle=idCalle
    where Cabaña.id_Cabaña=idCab_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Genetica*/
delimiter $$
create procedure Modificacion_Genetica(IN codGen_orig int,IN codGen_nuevo int,IN nomGen varchar(45),IN idCabaña int)
begin
	update Genetica set Codigo=codGen_nuevo,Nombre=nomGen,Cabaña_id_Cabaña=idCabaña
    where Genetica.Codigo=codGen_orig;
end$$
delimiter ;
#FUNCIONA

#Modificacion Plantel
delimiter $$
create procedure Modificacion_Plantel(IN cod_orig int,IN cod_nuevo int,IN _Nombre varchar(45),IN _edadGallinas int,IN _FechaEntrada date,IN _precioCompra int,IN Gen_Cod int)
begin
	update Plantel set Codigo=cod_nuevo,Nombre=_Nombre,Edad_Gallinas=_edadGallinas,Fecha_Entrada=_FechaEntrada,Precio_Compra=_precioCompra,Genetica_Codigo=Gen_Cod
    where Plantel.Codigo=cod_orig;
end$$
delimiter ;
#FUNCIONA


/* modificacion plantel tiene galpon*/
delimiter $$
create procedure Modificacion_Plantel_Tiene_Galpon(IN idPlantel_orig int,IN idPlantel_nuevo int,IN idGalpon_orig int,IN idGalpon_nuevo int)
begin
	update Plantel_tiene_Galpon set Plantel_Codigo=idPlantel_nuevo,Galpon_Numero=idGalpon_nuevo
    where Plantel_Codigo=idPlantel_orig and Galpon_Numero=idGalpon_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Galpon*/
delimiter $$
create procedure Modificacion_Galpon (IN numGalpon_orig int,IN numGalpon_nuevo int,IN ctdGallinas int)
begin
	update Galpon set Numero=numGalpon_nuevo,Ctdad_Gallinas=ctdGallinas
    where Numero=numGalpon_orig;
end$$
delimiter ;
#FUNCIONA


/* MODIFICACION PLANILLA */
delimiter $$
create procedure Modificacion_Planilla(IN NumGalpon_old int,IN fecha_old date,IN NumGalpon_new int,IN Fecha_new DATE,IN _ctdHuevos int,IN _ctdAlim int,IN tipoAlim varchar(45),IN ctdMuertes int,IN _Novedad text)
begin
	update Planilla set Galpon_Numero=NumGalpon_new,Fecha=Fecha_new,ctdad_huevos=_ctdHuevos,cant_alimento=_ctdAlim,
    tipo_Alimento=tipoAlim,ctdad_Muertas=ctdMuertes,novedades=_Novedad,Legajo_usuario=current_user(),FechaHora_Insert=now()
    where Planilla.Galpon_Numero=NumGalpon_old and Planilla.Fecha=fecha_old;
end$$
delimiter ;



/*MODIFICACION USUARIO */
delimiter $$
create procedure Modificacion_Usuarios(IN Legajo_orig varchar(45),IN _Nomb varchar(20),_Apellido varchar(23),IN Legajo_nuevo varchar(45), _Cuil varchar(45),
IN _User varchar(45),IN _Pass varchar(45))
begin
	update Usuarios set Nombre=_Nomb,Apellido=_Apellido,Legajo_Interno=Legajo_nuevo,Cuil=_Cuil,Username=_User,Usuarios.password=_Pass
    where Usuarios.Legajo_Interno=Legajo_orig;
end$$
delimiter ;
#PASSWORD ES UNA PALABRA RESERVADA, PERO IGUAL FUNCIONA.




/*============================FIN PROCEDURES DE MODIFICACIONES==================================================================*/









