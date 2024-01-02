SELECT 
   concat(primeiroNomeFuncionario," ",segundoNomeFuncionario) as Funcionário,
    c.nivelEscolaridade as 'Nivel de Escolaridade',
    fn.nomeFuncao as 'Funçâo',
    CASE 
        WHEN COUNT(DISTINCT fc.tbl_Competencia_idCompetencia) = COUNT(DISTINCT cp.tbl_Competencia_idCompetencia) THEN 'Sim'
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
LEFT JOIN 
    tbl_cursos_has_tbl_Competencia cp ON cc.tbl_cursos_idCurso = cp.tbl_cursos_idCurso
GROUP BY 
    f.idFuncionario;
