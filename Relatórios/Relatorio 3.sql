SELECT
    f.idFuncionario,
    f.primeiroNomeFuncionario,
    f.segundoNomeFuncionario,
    c.nivelEscolaridade,
    fun.nomeFuncao,
    CASE
        WHEN COUNT(DISTINCT comp.idCompetencia) = COUNT(DISTINCT f_comp.idCompetencia) THEN 'Sim'
        ELSE 'Não'
    END AS possuiCompetencias
FROM
    controle_pessoas.tbl_funcionario f
JOIN controle_pessoas.tbl_curriculo c ON f.tbl_curriculo_idCurriculo = c.idCurriculo
JOIN controle_pessoas.tbl_funcao fun ON f.tbl_funcao_idFuncao = fun.idFuncao
LEFT JOIN controle_pessoas.tbl_funcao_has_tbl_Competencia f_comp ON f.tbl_funcao_idFuncao = f_comp.tbl_funcao_idFuncao
LEFT JOIN controle_pessoas.tbl_Competencia comp ON f_comp.tbl_Competencia_idCompetencia = comp.idCompetencia
GROUP BY
    f.idFuncionario, f.primeiroNomeFuncionario, f.segundoNomeFuncionario, c.nivelEscolaridade, fun.nomeFuncao;
