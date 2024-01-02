SELECT 
    f.primeiroNomeFuncionario,
    f.segundoNomeFuncionario,
    c.nivelEscolaridade,
    fn.nomeFuncao,
    CASE 
        WHEN COUNT(DISTINCT fc.tbl_Competencia_idCompetencia) = COUNT(DISTINCT cc.tbl_Competencia_idCompetencia) THEN 'Sim'
        ELSE 'Não'
    END AS 'Possui Competências Necessárias'
FROM 
    tbl_funcionario f
JOIN 
    tbl_curriculo c ON f.tbl_curriculo_idCurriculo = c.idCurriculo
JOIN 
    tbl_funcao fn ON f.tbl_funcao_idFuncao = fn.idFuncao
LEFT JOIN 
    tbl_funcao_has_tbl_Competencia fc ON fn.idFuncao = fc.tbl_funcao_idFuncao
LEFT JOIN 
    tbl_curriculo_has_tbl_cursos cc ON c.idCurriculo = cc.tbl_curriculo_idCurriculo
GROUP BY 
    f.idFuncionario;
