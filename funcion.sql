-- Function: auditoria.log(character varying, character varying, integer, smallint, character varying, character varying, character varying, integer)

-- DROP FUNCTION auditoria.log(character varying, character varying, integer, smallint, character varying, character varying, character varying, integer);

CREATE OR REPLACE FUNCTION auditoria.log(
    esquema character varying,
    tabla character varying,
    idtabla integer,
    accion smallint,
    antiguo character varying,
    nuevo character varying,
    ip character varying,
    usuario integer)
  RETURNS void AS
$BODY$
declare
begin
	insert into auditoria.auditorias(esquema, tabla, idtabla, accion, antiguo, nuevo, ip, idusuario)
	values(esquema, tabla, idtabla, accion, antiguo, nuevo, ip, usuario);
	return;
	--esto es una prueba
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION auditoria.log(character varying, character varying, integer, smallint, character varying, character varying, character varying, integer)
  OWNER TO yp_aarias;
