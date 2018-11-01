

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

/*ver provincias, sus localidades y sus calles respectivas*/
select provincia.nombre as Provincia,localidad.nombre as Localidad,calle.nombre as Calle from provincia
inner join provincia_has_localidad on
provincia.idProv=provincia_has_localidad.provincia_idprov
inner join localidad on
localidad.idlocalidad=provincia_has_localidad.localidad_idlocalidad  # si cortmaos el join aca nos muestra solo provincias y localidades
inner join calle_has_localidad on
calle_has_localidad.localidad_idLocalidad=localidad.idLocalidad
inner join calle on
calle.idCalle=calle_has_localidad.calle_idCalle;


/*Fin de carga de Provincias, Localidades y Calles*/


