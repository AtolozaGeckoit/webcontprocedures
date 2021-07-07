CREATE OR REPLACE FUNCTION public."webcont$integrador_ver_todos"(
	)
    RETURNS TABLE(id_int integer, id_un character varying, id_cont character varying, nro_doc numeric, tip_doc integer, tip_comp character varying, rut_prov character varying, r_soc character varying, n_folio numeric, fech_doc date, fech_rec timestamp without time zone, fech_ac date, m_exen numeric, m_neto numeric, m_iva_rec numeric, monto_iva_no_recuperable numeric, cod_iva_no_rec numeric, m_tot numeric, m_net_a_fij numeric, iva_act_fij numeric, iva_us_com numeric, imp_sin_der_a_cred numeric, iva_no_ret numeric, tab_pur numeric, tab_cig numeric, tab_elab numeric, nce_o_nde_sobre_f_de_comp numeric, cod_otro_imp numeric, val_otro_imp numeric, tas_otro_imp numeric) 
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
-- ===================================================
-- Nombre: 		   webcont$integrador_ver_todos
-- Autor:          Alfredo Toloza
-- Fecha Creación: 07-07-2021
-- Descripción:    Procedimiento almacenado para visualizar  
-- todos campos de la tabla 'integrador'.
--
-- Parámetros:
-- No existen parámetros para esta versión.
--
-- Retorno:     
--  id_int integer,
--	id_un character varying,
--	id_cont character varying,
--	nro_doc numeric,
--	tip_doc integer,
--	tip_comp character varying,
--	rut_prov character varying,
--	r_soc character varying,
--	n_folio numeric,
--	fech_doc date,
--	fech_rec timestamp without time zone,
--	fech_ac date,
--	m_exen numeric,
--	m_neto numeric,
--	m_iva_rec numeric,
--	monto_iva_no_recuperable numeric,
--	cod_iva_no_rec numeric,
--	m_tot numeric,
--	m_net_a_fij numeric,
--	iva_act_fij numeric,
--	iva_us_com numeric,
--	imp_sin_der_a_cred numeric,
--	iva_no_ret numeric,
--	tab_pur numeric,
--	tab_cig numeric,
--	tab_elab numeric,
--	nce_o_nde_sobre_f_de_comp numeric,
--	cod_otro_imp numeric,
--	val_otro_imp numeric,
--	tas_otro_imp numeric
--
-- Historial:
-- 
--
-- =================================================
-- 			Declaraciones:
	
-- =================================================
SELECT
		id_integrador,
	    id_unico,
		id_contribuyente,
		nro,
		tipo_doc,
		tipo_compra,
		rut_proveedor,
		razon_social,
		folio,
		fecha_docto,
		fecha_recepcion,
		fecha_acuse,
		monto_exento,
		monto_neto,
		monto_iva_recuperable,
		monto_iva_no_recuperable,
		codigo_iva_no_rec,
		monto_total,
		monto_neto_activo_fijo,
		iva_activo_fijo,
		iva_uso_comun,
		impto_sin_derecho_a_credito,
		iva_no_retenido,
		tabacos_puros,
		tabacos_cigarrillos,
		tabacos_elaborados,
		nce_o_nde_sobre_fact_de_compra,
		codigo_otro_impuesto,
		valor_otro_impuesto,
		tasa_otro_impuesto
FROM

		integrador;
$BODY$;