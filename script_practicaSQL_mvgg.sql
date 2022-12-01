create schema practicaSQL_mvgg authorization rejnzqju;

create table practicaSQL_mvgg.group(
idgroup varchar(10) not null, --PK 
name varchar(50) not null,
description varchar(512) null
);

alter table practicaSQL_mvgg.group add constraint group_PK primary key(idgroup);

create table practicaSQL_mvgg.make_cars(
idmake_car varchar(10) not null, --PK 
name varchar(50) not null,
idgroup varchar(10) not null, --FK
description varchar(512) null
);

alter table practicaSQL_mvgg.make_cars add constraint make_cars_PK primary key(idmake_car);
alter table practicaSQL_mvgg.make_cars add constraint make_car_group_FK foreign key(idgroup) references practicaSQL_mvgg.group(idgroup);


create table practicaSQL_mvgg.models(
idmodel varchar(10) not null, --PK 
name varchar(50) not null,
idmake_car varchar(10) not null, --FK
description varchar(512) null
);

alter table practicaSQL_mvgg.models add constraint modelos_PK primary key(idmodel);
alter table practicaSQL_mvgg.models add constraint model_make_car_FK foreign key(idmake_car) references practicaSQL_mvgg.make_cars(idmake_car);


create table practicaSQL_mvgg.insurance_company(
idcompany varchar(10) not null, --PK 
name varchar(100) not null,
CIF varchar(10) not null,
phone varchar(15) null,
mail varchar (315) null,
description varchar(512) null
);

alter table practicaSQL_mvgg.insurance_company add constraint insurace_company_PK primary key(idcompany);

create table practicaSQL_mvgg.color(
idcolor varchar(10) not null, ---PK
name varchar(50) not null,
description varchar(512) null
);

alter table practicaSQL_mvgg.color add constraint color_PK primary key(idcolor);


create table practicaSQL_mvgg.vehicles(
idvehicle varchar(10) not null, --PK
idgroup varchar(10) not null, --FK ---> group_make_car --->idgroup
idmake_car varchar(10) not null, --FK
idmodel varchar(10) not null, --FK
number_plate varchar(15) not null,
idcolor varchar(15) not null, --FK
kms int not null,
idcompany varchar(10) not null,--FK
num_policy varchar(50) not null,
dt_bought date not null
);

alter table practicaSQL_mvgg.vehicles add constraint vehicles_PK primary key(idvehicle);
alter table practicaSQL_mvgg.vehicles add constraint vehicle_group_FK foreign key(idgroup) references practicaSQL_mvgg.group(idgroup);
alter table practicaSQL_mvgg.vehicles add constraint vehicle_make_car_FK foreign key(idmake_car) references practicaSQL_mvgg.make_cars(idmake_car);
alter table practicaSQL_mvgg.vehicles add constraint vehicle_model_FK foreign key(idmodel) references practicaSQL_mvgg.models(idmodel);
alter table practicaSQL_mvgg.vehicles add constraint vehicle_color_FK foreign key(idcolor) references practicaSQL_mvgg.color(idcolor);
alter table practicaSQL_mvgg.vehicles add constraint vehicle_company_FK foreign key(idcompany) references practicaSQL_mvgg.insurance_company(idcompany);


create table practicaSQL_mvgg.currency(
idcurrency varchar(100) not null, --PK
name varchar(50) not null,
description varchar (512) null
);

alter table practicaSQL_mvgg.currency add constraint currency_PK primary key(idcurrency);

create table practicaSQL_mvgg.revisions(
dt_revision date not null, ---PK
idvehicle varchar(10) not null, --FK
kms int not null,
price decimal not null,
idcurrency varchar(100) not null, ---FK
description varchar(512) null
);

alter table practicaSQL_mvgg.revisions add constraint revision_PK primary key(dt_revision, idvehicle);
alter table practicaSQL_mvgg.revisions add constraint revision_vehicle_FK foreign key(idvehicle) references practicaSQL_mvgg.vehicles(idvehicle);
alter table practicaSQL_mvgg.revisions add constraint revision_currencu_FK foreign key(idcurrency) references practicaSQL_mvgg.currency(idcurrency);


----METEMOS LOS DATOS----

insert into practicaSQL_mvgg.color (idcolor, name, description) values('01','negro','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('02','blanco','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('03','gris','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('04','rojo','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('05','azul','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('06','amarillo','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('07','verde','');
insert into practicaSQL_mvgg.color (idcolor, name, description) values('08','otros','');

insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('01','EURO','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('02','DOLAR','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('03','LIBRA ESTERLINA','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('04','YUAN','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('05','CORONA DANÉS','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('06','FRANCO','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('07','RUBLO','');
insert into practicaSQL_mvgg.currency (idcurrency, name, description) values('08','OTROS','');

insert into practicaSQL_mvgg.group (idgroup, name, description) values('01','BMW Group','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('02','Daimler','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('03','FCA','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('04','Ford','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('05','Geely','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('06','General Motors','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('07','Honda','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('08','Hyundai','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('09','Renault-Nissan','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('10','PSA','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('11','Tata','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('12','Toyota','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('13','Volkswagen','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('14','Suzuki','');
insert into practicaSQL_mvgg.group (idgroup, name, description) values('15','Mazda','');

insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('01','Allianz','1234','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('02','AXA','2345','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('03','Generali','5647','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('04','Catalana Occidente','4521','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('05','Genesis','9512','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('06','Helvetia','7532','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('07','Linea Directa','7849','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('08','MAPFRE','4564','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('09','Mutua Madrileña','6546','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('10','Pelayo','1231','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('11','Qualitas Auto','3213','','','');
insert into practicaSQL_mvgg.insurance_company (idcompany, name, cif, phone, mail, description) values('12','Reale Seguros','7989','','','');

insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('01','Alfa Romeo','03','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('02','Audi','13','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('03','BMW','01','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('04','Citroën','10','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('05','Dacia','09','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('06','DS','10','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('07','Fiat','03','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('08','Ford','04','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('09','Honda','07','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('10','Hyundai','08','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('11','Kia','08','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('12','Mazda','15','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('13','Mercedes','02','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('14','Mini','01','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('15','Nissan','09','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('16','Opel','10','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('17','Peugeot','10','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('18','Renault','09','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('19','SEAT','13','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('20','Skoda','13','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('21','Smart','02','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('22','Suzuki','14','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('23','Toyota','12','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('24','Volkswagen','13','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('25','Volvo','05','');
insert into practicaSQL_mvgg.make_cars (idmake_car, name, idgroup, description) values('26','Chevrolet','06','');

insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('01','Tonale','01','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('02','Stelvio','01','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('03','A1','02','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('04','A4','02','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('05','Serie 1','03','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('06','Serie 2','03','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('07','C3','04','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('08','Duster','05','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('09','DS 3','06','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('10','Fiat 500','07','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('11','Fiesta','08','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('12','Focus','08','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('13','Civic','09','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('14','i20','10','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('15','Picanto','11','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('16','Mazda2 ','12','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('17','CLA coupé','13','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('18','Cooper','14','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('19','Micra','15','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('20','Corsa','16','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('21','208','17','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('22','Clio','18','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('23','Captur','18','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('24','Ibiza','19','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('25','León','19','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('26','Fabia','20','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('27','Bravus','21','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('28','Ignis','22','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('29','Yaris','23','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('30','Golf','24','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('31','Polo','24','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('32','XC40','25','');
insert into practicaSQL_mvgg.models (idmodel, name, idmake_car, description) values('33','Spark','26','');

insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('001','01','03','05','ABC1247','01','20206','01','1050','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('002','02','13','17','BCD2587','02','29448','08','1063','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('003','03','01','02','CDF7469','03','28306','07','1051','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('004','04','08','11','FDC8400','04','12744','09','1057','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('005','13','24','31','GBS1340','05','10815','05','1077','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('006','06','26','33','KLL4930','06','10770','04','1079','2020-10-019');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('007','04','08','12','GDF7961','07','26875','03','1058','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('008','08','10','14','JFG2258','01','27248','05','1060','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('009','09','05','08','JKL3374','02','21874','09','1054','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('010','10','04','07','AGJ9417','03','13620','11','1053','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('011','10','16','20','JKL9985','04','11904','08','1066','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('012','12','23','29','LDD5523','05','10956','06','1075','2020-02-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('013','13','02','03','GDF3456','06','14294','02','1052','2020-01-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('014','14','22','28','MAG9741','07','10527','02','1074','2020-10-18');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('016','01','14','18','TZX8526','02','29419','11','1064','2020-10-21');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('017','02','21','27','LML3064','03','15114','03','1073','2020-10-11');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('018','03','07','10','JJK2054','04','13581','10','1056','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('019','08','11','15','GDF5010','05','16344','04','1061','2020-05-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('020','05','25','32','DDF9963','06','13751','01','1078','2020-10-13');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('021','09','18','22','HWZ5420','07','21010','08','1068','2020-10-03');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('022','07','09','13','GMV1989','08','11509','07','1059','2020-10-02');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('023','10','17','21','HRC1889','01','19926','07','1067','2020-06-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('024','09','15','19','AAC1992','02','19126','05','1065','2020-07-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('025','10','06','09','ACC7850','03','23937','12','1055','2020-08-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('026','09','18','23','GDF6819','04','13656','12','1069','2020-09-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('027','13','19','24','GGA8819','05','19698','06','1070','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('028','13','19','25','DDS2022','06','22113','10','1071','2020-10-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('029','13','20','26','HWZ3231','07','10558','03','1072','2020-12-01');
insert into practicaSQL_mvgg.vehicles (idvehicle, idgroup, idmake_car, idmodel, number_plate, idcolor, kms, idcompany, num_policy, dt_bought) values('030','13','24','30','CCD5698','08','23317','11','1076','2020-11-013');

insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','001','20206','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','002','29448','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','003','28306','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','004','12744','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','005','10815','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','006','10770','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','007','26875','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','008','27248','200','02','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','009','21874','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','010','13620','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','011','11904','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','012','10956','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','013','14294','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','014','10527','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2021-12-01','011','29228','200','01','Segunda Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','016','29419','200','03','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','017','15114','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','018','13581','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','019','16344','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','020','13751','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','021','21010','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','022','11509','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','023','19926','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','024','19126','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','025','23937','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','026','13656','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','027','19698','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','028','22113','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','029','10558','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2020-12-01','030','23317','200','01','Primera Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2021-12-01','026','17656','200','01','Segunda Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2021-12-01','027','20698','200','01','Segunda Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2021-12-01','028','24113','200','01','Segunda Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2021-12-01','029','11558','200','01','Segunda Revisión');
insert into practicaSQL_mvgg.REVISIONS (dt_revision, idvehicle, kms, price, idcurrency, description) values('2021-12-01','030','24317','200','01','Segunda Revisión');



select a.idvehicle, b.name as make_car, c.name as Model, d.name as Group, a.number_plate, f.name as Color, a.kms , a.dt_bought, e.name as Insurance_Comp , a.num_policy  
from practicaSQL_mvgg.vehicles a, practicaSQL_mvgg.make_cars b, practicaSQL_mvgg.models c, practicaSQL_mvgg.group d, practicaSQL_mvgg.insurance_company e, practicaSQL_mvgg.color f
where a.idmake_car = b.idmake_car and a.idmodel = c.idmodel and a.idgroup = d.idgroup and a.idcolor = f.idcolor and a.idcompany = e.idcompany ;