SELECT
    tbl_funcionario.estado_civil,
    tbl_funcionario.doadorOrgaos,
    CONCAT(tbl_dependentes.primeiroNomeDependente, ' ', tbl_dependentes.segundoNomeDependente) AS nomeDependente,
    CONCAT(tbl_funcionario.primeiroNomeFuncionario, ' ', tbl_funcionario.segundoNomeFuncionario) AS nome,
    tbl_exames.valorReferencia,
    tbl_laudo.resultado,
    CASE
        WHEN tbl_exames.idExame = 3 THEN
            (SELECT tbl_exames.nomeExame
             FROM tbl_exames AS e
             WHERE e.idFuncionario = tbl_funcionario.idFuncionario
               AND e.dataExame = (SELECT MAX(ex.dataExame)
                                  FROM tbl_exames AS ex
                                  WHERE ex.idExame = 3
                                    AND ex.idFuncionario = tbl_funcionario.idFuncionario
                                  GROUP BY ex.idExame, ex.idFuncionario))
        ELSE tbl_exames.nomeExame
    END AS ultimoExame
FROM
    tbl_funcionario
LEFT JOIN tbl_dependentes ON tbl_funcionario.idFuncionario = tbl_dependentes.idFuncionario
LEFT JOIN tbl_exames ON tbl_funcionario.idFuncionario = tbl_exames.idFuncionario AND tbl_exames.idExame
LEFT JOIN tbl_laudo ON tbl_funcionario.idFuncionario = tbl_exames.idExame;
