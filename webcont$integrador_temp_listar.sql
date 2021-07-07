CREATE OR REPLACE FUNCTION public."webcont$integrador_temp_listar"(
	)
    RETURNS TABLE(id_int_temp integer, id_cont character varying, rut_prov character varying, n_folio numeric, fech_doc date, m_tot numeric) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
-- ===================================================
-- Nombre: 		   webcont$integrador_temp_listar
-- Autor:          Alfredo Toloza
-- Fecha Creación: 07-07-2021
-- Descripción:    Procedimiento almacenado para visualizar  
-- todos campos de la tabla 'integrador_temp'.
--
-- Parámetros:
-- No existen parámetros para esta versión.
--
-- Retorno:     
--  id_int_temp integer,
--	id_cont character varying,
--	rut_prov character varying,
--	n_folio numeric,
--	fech_doc date,
--	m_tot numeric
--
-- Historial:
-- 
--
-- =================================================
-- 			Declaraciones:
	
-- =================================================
SELECT
		id_integrador_temp,
		id_contribuyente,
		rut_proveedor,
		folio,
		fecha_docto,
		monto_total
		
FROM

		integrador_temp;
$BODY$;