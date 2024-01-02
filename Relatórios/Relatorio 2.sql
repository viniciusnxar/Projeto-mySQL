select tbl_funcionario.estado_civil,
tbl_funcionario.doadorOrgaos,
CONCAT(tbl_dependentes.primeiroNomeDependente, " ", tbl_dependentes.primeiroNomeDependente) AS nomeDependente,
CONCAT(tbl_funcionario.primeiroNomeFuncionario, " ", tbl_funcionario.segundoNomeFuncionario) AS nome,
tbl_exames.valorReferencia,
tbl_laudo.resultado,
case
when tbl_exames.idExame = 3 then 
(select tbl_exames.nomeExame from tbl_exames as e where e.idFuncionario = tbl_funcionario.idFuncionario and  e.dataExame = (select max(ex.dataExame) from tbl_exames as ex where ex.idExame = 3 and ex.idFuncionario = tbl_funcionario.idFuncionario GROUP BY ex.idExame, ex.idFuncionario))
else tbl_exames.nomeExame


end AS ultimoExame

from tbl_funcionario
LEFT JOIN tbl_dependentes on tbl_funcionario.idFuncionario = tbl_dependentes.idFuncionario
LEFT JOIN tbl_exames on tbl_funcionario.idFuncionario = tbl_exames.idFuncionario and tbl_exames.idExame
LEFT JOIN tbl_laudo on tbl_funcionario.idFuncionario = tbl_exames_idExame;