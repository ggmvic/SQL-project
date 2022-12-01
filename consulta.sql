----CONSULTA----

select a.idvehicle, b.name as make_car, c.name as Model, d.name as Group, a.number_plate, f.name as Color, a.kms , a.dt_bought, e.name as Insurance_Comp , a.num_policy  
from practicaSQL_mvgg.vehicles a, practicaSQL_mvgg.make_cars b, practicaSQL_mvgg.models c, practicaSQL_mvgg.group d, practicaSQL_mvgg.insurance_company e, practicaSQL_mvgg.color f
where a.idmake_car = b.idmake_car and a.idmodel = c.idmodel and a.idgroup = d.idgroup and a.idcolor = f.idcolor and a.idcompany = e.idcompany ;