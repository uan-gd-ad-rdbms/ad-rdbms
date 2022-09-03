/**
  Precondicion el folde o carpeta debe existir
  Ejemplo: C:\Users\dell\Documents\Luigi\UAN\Arquitectura Datos\Proyectos DataGrip\taller-dbms\Tablespace
 */
CREATE TABLESPACE uan_rdbms_ts_lab12
	OWNER postgres
	LOCATION ?;
ALTER TABLESPACE uan_rdbms_ts_lab12
	OWNER to usr_uan_laboratorio12;