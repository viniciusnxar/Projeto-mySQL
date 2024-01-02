select 
	concat(primeiroNomeFuncionario, ' ', segundoNomeFuncionario) as nome_funcionario,
    tbl_setor.nomeSetor,
    monthname(data_inicio) as mes,
    (		
        (select count(*) from tbl_ferias as f where f.idFerias = tbl_ferias.idFerias and f.tbl_funcionario_idFuncionario = tbl_funcionario.idFuncionario) * 100 / 
        (select count(*) from tbl_funcionario_has_tbl_setor as s where s.tbl_setor_idSetor = tbl_setor.idSetor)
    ) as percentual
from
	tbl_funcionario
join tbl_funcionario_has_tbl_setor on tbl_funcionario.idFuncionario = tbl_funcionario_has_tbl_setor.tbl_funcionario_idFuncionario
join tbl_setor on tbl_funcionario_has_tbl_setor.tbl_setor_idSetor = tbl_setor.idSetor
join tbl_ferias on tbl_ferias.tbl_funcionario_idFuncionario = tbl_funcionario.idFuncionario
where
	YEAR(tbl_ferias.data_inicio) = 2023;
    
