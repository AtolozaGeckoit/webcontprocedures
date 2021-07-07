CREATE OR REPLACE FUNCTION public."webcont$integrador_insertar"(
	id_un character varying,
	id_cont character varying,
	nro_doc numeric,
	tip_doc integer,
	tip_comp character varying,
	rut_prov character varying,
	r_soc character varying,
	n_folio numeric,
	fech_doc date,
	fech_rec timestamp without time zone,
	fech_ac date,
	m_exen numeric,
	m_neto numeric,
	m_iva_rec numeric,
	monto_iva_no_recuperable numeric,
	cod_iva_no_rec numeric,
	m_tot numeric,
	m_net_a_fij numeric,
	iva_act_fij numeric,
	iva_us_com numeric,
	imp_sin_der_a_cred numeric,
	iva_no_ret numeric,
	tab_pur numeric,
	tab_cig numeric,
	tab_elab numeric,
	nce_o_nde_sobre_f_de_comp numeric,
	cod_otro_imp numeric,
	val_otro_imp numeric,
	tas_otro_imp numeric,
	OUT res boolean)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
-- ===================================================
-- Nombre: 		   webcont$integrador_insertar
-- Autor:          Alfredo Toloza
-- Fecha Creación: 07-07-2021
-- Descripción:    Inserta campos provenientes de 
-- archivo excel -linea por linea- en tabla 'integrador'.
-- En caso que ya exista el registro 'id_unico', 
-- se inserta en tabla temporal 'integrador_temp' 
-- donde se almacenarán todos los registros fallidos/repetidos
--
-- Parámetros:
--    id_un character varying /NOT NULL,
--    id_cont character varying /NOT NULL, 
--    nro_doc numeric,
--    tip_doc integer,
--    tip_comp character varying,
--    rut_prov character varying /NOT NULL,
--    r_soc character varying,
--    n_folio numeric /NOT NULL,
--    fech_doc date /NOT NULL,
--    fech_rec timestamp without time zone,
--    fech_ac date,
--    m_exen numeric,
--    m_neto numeric,
--    m_iva_rec numeric,
--    monto_iva_no_recuperable numeric,
--    cod_iva_no_rec numeric,
--    m_tot numeric /NOT NULL,
--    m_net_a_fij numeric,
--    iva_act_fij numeric,
--    iva_us_com numeric,
--    imp_sin_der_a_cred numeric,
--    iva_no_ret numeric,
--    tab_pur numeric,
--    tab_cig numeric,
--    tab_elab numeric,
--    nce_o_nde_sobre_f_de_comp numeric,
--    cod_otro_imp numeric,
--    val_otro_imp numeric,
--    tas_otro_imp numeric
--
-- Retorno:     
-- res - variable tipo boolean.
-- En caso de inserción correcta, arroja 'true', 
-- de lo contrario 'false'. La inserción se verifica 
-- devolviendo el ID de la tabla guardándolo en una variable
-- que se revisa al finalizar el statement INSERT.
--
-- Cualquier otro error será enviado por PGSQL_EXCEPTION.
--
-- Historial:
-- 
--
-- =================================================
-- 			Declaraciones:
	declare _idout integer;
-- =================================================

BEGIN

if not exists(select id_unico from integrador 
			  where id_unico = id_un)then
	
	INSERT INTO integrador 
	(
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
	)
	
	VALUES
	
	(
		id_un,
		id_cont,
		nro_doc,
		tip_doc,
		tip_comp,
		rut_prov,
		r_soc,
		n_folio,
		fech_doc,
		fech_rec,
		fech_ac,
		m_exen,
		m_neto,
		m_iva_rec,
		monto_iva_no_recuperable,
		cod_iva_no_rec,
		m_tot,
		m_net_a_fij,
		iva_act_fij,
		iva_us_com,
		imp_sin_der_a_cred,
		iva_no_ret,
		tab_pur,
		tab_cig,
		tab_elab,
		nce_o_nde_sobre_f_de_comp,
		cod_otro_imp,
		val_otro_imp,
		tas_otro_imp
	) returning id_integrador into _idout;
	
		if(_idout <> 0)then
			res:='true';
		else
			RAISE EXCEPTION '% - Error al insertar registro', now();
		end if;
		
else

	insert into integrador_temp
	(id_contribuyente, rut_proveedor, folio, fecha_docto, monto_total)
	values (id_cont, rut_prov, n_folio,fech_doc, m_tot);
	res:='false';
	
end if;
	
END;
$BODY$;