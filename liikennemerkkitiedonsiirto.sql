insert into asm."Asset"(name, geom_point) select fid_, ST_Collect(ST_SetSRID(ST_MakePoint(cast(x as double precision),cast(y as double precision),cast(z as double precision),0.0),3879)) from public.liikennemerkit group by fid_;
insert into asm."TrafficSign" 
select 
cast(l.fid_ as integer), 
cast(l.x as double precision), 
cast(l.y as double precision), 
cast(l.z as double precision), 
cast(l.stdx as double precision), 
cast(l.stdy as double precision), 
cast(l.stdz as double precision), 
--cast(l.signtype as number), 
-- pit‰‰ korjata integer varchariksi
0,
l.signtext, 
l.signdrager
, 
cast(l.date_recor as date), 
cast(l.geometry_d as integer)
, 
a.gid 
from public.liikennemerkit l 
join asm."Asset" a
on (l.fid_ = a.name);

------


select l.signtype from public.liikennemerkit l group by l.signtype;