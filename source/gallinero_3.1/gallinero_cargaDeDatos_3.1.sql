

/*============================CARGA DE DATOS TP CUATRIMESTRAL============================*/

use granja_tpcuatrimestral;

call alta_Provincia(1,"Buenos Aires");
/*Localidades*/
call alta_localidad("Burzaco",1);
call alta_localidad("Lomas de Zamora",2);
call alta_localidad("Lanus",3);
call alta_localidad("Avellaneda",4);
/*asociamos localidades con la provincia mediante la tabla intermedia*/
call alta_prov_has_localidad(1,1);  /*ID PROV, ID LOC*/
call alta_prov_has_localidad(1,2);
call alta_prov_has_localidad(1,3);
call alta_prov_has_localidad(1,4);

/*Calles*/
call alta_calle("25 de Mayo",1);
call alta_calle("Madariaga",2);
call alta_calle("Maestruli",3);
call alta_calle("Joaquin V. Gonzalez",4);
/*asociar calles a las localidades*/
call alta_calle_has_localidad(1,1);
call alta_calle_has_localidad(1,2);
call alta_calle_has_localidad(2,3);
call alta_calle_has_localidad(3,4);
call alta_calle_has_localidad(4,3);  /*ID CALLE, ID LOCALIDAD*/




call alta_Provincia(2,"CABA");
/*Localidades*/
call alta_localidad("Constitucion",5);
call alta_localidad("Flores",6);
call alta_localidad("Palermo",7);
call alta_localidad("Villa Luro",8);
/*asociamos localidades a las provincias*/
call alta_prov_has_localidad(2,5);  /*ID PROV, ID LOC*/
call alta_prov_has_localidad(2,6);
call alta_prov_has_localidad(2,7);
call alta_prov_has_localidad(2,8);
/*Calles*/
call alta_calle("Ridavia",5);
call alta_calle("Esnaola",6);
call alta_calle("Avenida Sapito",7);
/*asociamos calles a las localidades*/
call alta_calle_has_localidad(5,5);  /*ID CALLE, ID LOCALIDAD*/
call alta_calle_has_localidad(5,6);
call alta_calle_has_localidad(6,1);
call alta_calle_has_localidad(7,2);
call alta_calle_has_localidad(7,6);
call alta_calle_has_localidad(7,8);
call alta_calle_has_localidad(6,7);




call alta_Provincia(3,"San Luis");
/*Localidades*/
call alta_localidad("Ayacucho",9);
call alta_localidad("Belgrano",10);
call alta_localidad("Chacabuco",11);
call alta_localidad("Arizona",12);
/*asociamos localidades a la provincia*/
call alta_prov_has_localidad(3,9);  /*ID PROV, ID LOC*/
call alta_prov_has_localidad(3,10);
call alta_prov_has_localidad(3,11);
call alta_prov_has_localidad(3,12);
/*Calles*/
call alta_calle("Nuremberg",8);
call alta_calle("Bariloche",9);
call alta_calle("Estados Unidos",11);
call alta_calle("Castro Barros",12);
call alta_calle("Munich",13);
/*asociamos localidades a las calles*/
call alta_calle_has_localidad(8,9);  /*ID CALLE, ID LOCALIDAD*/
call alta_calle_has_localidad(9,10);
call alta_calle_has_localidad(8,11);
call alta_calle_has_localidad(11,10);
call alta_calle_has_localidad(11,12);
call alta_calle_has_localidad(12,10);
call alta_calle_has_localidad(4,12);

select * from calle;

/*ver provincias, sus localidades y sus calles respectivas*/ -- usar para cargar los clientes y cabañas
select provincia.nombre as Provincia,provincia.idProv as idProvin,localidad.nombre as Localidad,localidad.idLocalidad as IdLocal,calle.nombre as Calle,calle.Idcalle as idCalle from provincia
inner join provincia_has_localidad on
provincia.idProv=provincia_has_localidad.provincia_idprov
inner join localidad on
localidad.idlocalidad=provincia_has_localidad.localidad_idlocalidad  # si cortmaos el join aca nos muestra solo provincias y localidades
inner join calle_has_localidad on
calle_has_localidad.localidad_idLocalidad=localidad.idLocalidad
inner join calle on
calle.idCalle=calle_has_localidad.calle_idCalle;


/*Fin de carga de Provincias, Localidades y Calles*/


/*carga de clientes*/

call alta_clientes("Ricardo Perez","20-9928134-12",33,6,1,1);
call alta_clientes("Mario Herrera","20-2111232-14",50,7,2,1);
call alta_clientes("Tomas Jones","15-22134124-12",2134,4,3,1);
call alta_clientes("Mariela Mariluz","18-23122452-19",1234,3,4,1);

call alta_clientes("Amparo Fernandez","15-7772134-14",500,5,5,2);
call alta_clientes("Juana Repetto","20-8823434-14",2377,5,6,2);
call alta_clientes("Juan Flores","15-4232134-14",372,6,7,2);
call alta_clientes("Mariluz Fernandez","22-2222222-14",9923,7,8,2);


call alta_clientes("Juanito Alegria","14-7772134-14",233,11,10,3);
call alta_clientes("Ignacio Montaña","20-1234567-14",2377,8,11,3);
call alta_clientes("Jose Andrea","15-231111-14",372,12,10,3);
call alta_clientes("Esteban Chimbo","22-6666666-14",372,12,10,3); #test para ver si puede haber 2 con la misma direccion

select * from clientes;
/*fin de carga de clientes*/


/*carga de cabañas*/

call alta_cabaña("Los Pollos Hermanos SRL",1,"20-99999-28",600,3,4,1);
call alta_cabaña("La Polerria SA",2,"20-6627134-28",610,6,1,1);
call alta_cabaña("La Querencia",3,"20-1234-39",421,7,2,1);
call alta_cabaña("Codigo POLLO",4,"20-9922713-21",382,5,6,2);
call alta_cabaña("Don Mario",5,"20-1234-39",991,6,7,2);
call alta_cabaña("Abuelo Juan",6,"20-98765-14",239,3,4,2);

select * from cabaña;

/*fin de carga de cabañas*/


/*geneticas*/
call alta_genetica(1,"Mayor Produccion",1);
call alta_genetica(2,"Cresta Simple",1);
call alta_genetica(3,"Cresta Guisante",2);
call alta_genetica(4,"Cresta en Rosa",3);
call alta_genetica(5,"Tipo Salvaje",4);
call alta_genetica(6,"Cresta en Fresa",5);
call alta_genetica(7,"Cresta Doble",6);
/*fin carga geneticas*/



/*carga de planteles*/
call alta_plantel(1,"Pollitos",4,'2018-07-22',1000,1); -- YYYY/MM/DD
call alta_plantel(2,"Adultas",8,'2018-01-14',1500,2);
call alta_plantel(3,"Ponedoras",1,'2018-12-21',500,3);
call alta_plantel(4,"Modificadas",3,'2018-04-02',700,4);
call alta_plantel(5,"Genetica Normal",2,'2017-05-14',2500,5);
call alta_plantel(6,"Nueva Crianza",6,'2018-08-11',3000,6);


/*carga de galpones*/
call alta_galpon(1,200);
call alta_galpon(2,100);
call alta_galpon(3,150);
call alta_galpon(4,300);
call alta_galpon(5,120);



/*carga plantel_tiene_galpon*/
call alta_plantel_tiene_galpon(1,1);
call alta_plantel_tiene_galpon(1,2);
call alta_plantel_tiene_galpon(2,3);
call alta_plantel_tiene_galpon(3,4);
call alta_plantel_tiene_galpon(4,5);


/*cargo usuarios --> para poder armar planillas*/
call alta_usuarios("Tomas","Jones",current_user(),"21-288182-23","Tom","tomi123");
call alta_usuarios("Juan","Peralta","localUser","20-40892123-20","Juansito","juan889");
call alta_usuarios("Hernan","Migulete","441923","20-42213123-20","Hernancito","herni456");



/*cargo planillas --> user y hora de insert se cargan automaticamente en el procedure*/
call Alta_Planilla(1,'2018-11-05',20,450,"Proteina",5,"---");
call Alta_Planilla(2,'2018-10-03',25,420,"Calcio",2,"---");
call Alta_Planilla(3,'2017-12-25',50,300,"Carburante",0,"Muchos Huevos");
call Alta_Planilla(4,'2018-10-23',43,420,"Mas PS",4,"---");
call Alta_Planilla(5,'2018-04-20',50,300,"Esteroidico",20,"Defuncion Anormal");
call alta_planilla(1,'2018-11-02',30,440,"Hierro",7,"---");

/*modifico el primer registro que cargue para que se guarde en planilla_log*/
call Modificacion_Planilla(1,'2018-11-05',1,'2018-11-05',10,400,"Mas PP",5,"----");
select * from planilla_log;
select * from planilla;
/*funciona*/



/*carga empaques*/
call alta_empaque(1,"Media Docena",6);
call alta_empaque(2,"Docena",12);
call alta_empaque(3,"Maple",30);


/*productos*/
call alta_productos(1,20,1);
call alta_productos(2,50,2);
call alta_productos(3,120,3);


/*Facturas con el detalle de las mismas*/
call Alta_Factura(1,"14-7772134-14",'2018-06-11');
call Alta_Detalle_Factura(1,1,1,20); 	/*ID FACT, ID PROD, CANT, PRECIO*/
call Alta_Detalle_Factura(1,2,2,50);

call alta_Factura(2,"20-8823434-14",'2018-11-18');
call Alta_Detalle_Factura(2,2,4,50); 	/*ID FACT, ID PROD, CANT, PRECIO*/
call Alta_Detalle_Factura(2,3,4,120);
call Alta_Detalle_Factura(2,1,5,20);


call alta_Factura(3,"18-23122452-19",'2018-11-12');
call Alta_Detalle_Factura(3,1,2,20); 	/*ID FACT, ID PROD, CANT, PRECIO*/
call Alta_Detalle_Factura(3,2,2,50);
call Alta_Detalle_Factura(3,3,2,120);


call alta_Factura(4,"15-7772134-14",'2017-10-03');
call Alta_Detalle_Factura(4,3,2,120); 	/*ID FACT, ID PROD, CANT, PRECIO*/

call Alta_Factura(5,"14-7772134-14",'2011-06-11');
call Alta_Detalle_Factura(5,1,5,20); 	/*ID FACT, ID PROD, CANT, PRECIO*/
call Alta_Detalle_Factura(5,2,5,50);



/*imprimir facturas con su detalle*/
select idFactura,Clientes_Cuit,empaque.descripcion,cantidad_prod,precio from factura
inner join detalle_factura on factura.idFactura=detalle_factura.Factura_idFactura
inner join productos on productos.codigo_prod=detalle_factura.productos_codigo_prod
inner join empaque on productos.empaque_idEmpaque=empaque.idEmpaque
order by idFactura;











































