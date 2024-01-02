SELECT 
    f.primeiroNomeFuncionario,
    f.segundoNomeFuncionario,
    s.nomeSetor AS 'Local de Trabalho',
    fn.nomeFuncao,
    CASE 
        WHEN l.estaApto = 1 THEN 'APTO'
        ELSE 'NÃO APTO'
    END AS 'Status da Consulta Ocupacional'
FROM 
    tbl_funcionario f
JOIN 
    tbl_funcao fn ON f.tbl_funcao_idFuncao = fn.idFuncao
JOIN 
    tbl_funcionario_has_tbl_setor fs ON f.idFuncionario = fs.tbl_funcionario_idFuncionario
JOIN 
    tbl_setor s ON fs.tbl_setor_idSetor = s.idSetor
JOIN 
    tbl_exames e ON f.idFuncionario = e.idFuncionario
JOIN 
    tbl_laudo l ON e.idExame = l.tbl_exames_idExame
WHERE 
    e.dataExame = (SELECT MAX(dataExame) FROM tbl_exames WHERE idFuncionario = f.idFuncionario);