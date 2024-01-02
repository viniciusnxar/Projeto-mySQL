SELECT 
	CONCAT(primeiroNomeFuncionario, ' ', segundoNomeFuncionario) AS nome_funcionario,
    tbl_setor.nomeSetor,
    monthname(data_inicio) AS mes,
    (		
        (SELECT COUNT(*) FROM tbl_ferias AS f WHERE f.idFerias = tbl_ferias.idFerias AND f.tbl_funcionario_idFuncionario = tbl_funcionario.idFuncionario) * 100 / 
        (SELECT COUNT(*) FROM tbl_funcionario_has_tbl_setor AS s WHERE s.tbl_setor_idSetor = tbl_setor.idSetor)
    ) as percentual
FROM
	tbl_funcionario
JOIN tbl_funcionario_has_tbl_setor ON tbl_funcionario.idFuncionario = tbl_funcionario_has_tbl_setor.tbl_funcionario_idFuncionario
JOIN tbl_setor ON tbl_funcionario_has_tbl_setor.tbl_setor_idSetor = tbl_setor.idSetor
JOIN tbl_ferias ON tbl_ferias.tbl_funcionario_idFuncionario = tbl_funcionario.idFuncionario
WHERE
	YEAR(tbl_ferias.data_inicio) = 2023;
    
