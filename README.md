# Projeto MySQL - Sistema de Controle de Pessoal

 ## Cenario apresentado:
As empresas têm como seu principal patrimônio as pessoas que nela trabalham. Os funcionários
da empresa são a engrenagem que faz a empresa se tornar grande e ter sucesso, gerando
produtos e serviços de valor para os clientes. Fato que sendo tão importantes, precisamos ter
registro dos funcionários e tudo que é importante para ele. Para resolver essa necessidade de
controle, vamos construir um sistema que registre os funcionários da empresa com suas
características pessoais como nome, telefones, endereços, necessidades especiais, tipo
sanguíneo etc. Esses funcionários precisam ter sua saúde monitorada e assim, precisamos
registrar as características de saúde de cada um como possíveis doenças, necessidades e
limitações derivadas de problemas de saúde. Um cadeirante, por exemplo, precisa de rampas
de acesso para garantir seu acesso ao local de trabalho. Podem existir diversas necessidades
especiais que além de precisarem ser registradas, precisam ter o registro das várias possíveis
obrigações da empresa relacionadas com a necessidade (rampas de acesso, sistemas com
suporte a pessoas com deficiência visual etc.). Para o acompanhamento da saúde, será
necessário também um registro dos exames de saúde nos exames ocupacionais. Quando o
funcionário fizer um exame de glicemia, deve ficar registrado o exame, o resultado e haver na
base de dados quais os valores de referência. Outro ponto a ser controlado é o registro dos
dependentes. O dependente precisa ter registado além de seu nome, o tipo da dependência
(filha(o), esposa(o), etc), data de nascimento e se é universitário ou não pois se for universitário,
para o imposto de renda, continuará dependente do funcionário até atingir 24 anos. Cada
funcionário trabalhará em um setor e o sistema deverá registrar o setor onde ele trabalha, sua
função no setor e, essas informações devem guardar histórico. Assim, se eu precisar saber por
que setores um funcionário passou, quando começou e quando saiu do local, terei como saber.
O sistema deverá também controlar as férias do funcionário, indicando qual a data de início, fim
e quantidade de dias. O sistema deverá poder garantir que cada setor irá liberar no máximo 30%
da força de trabalho em cada setor. Todo funcionário também deverá ter registrado sua
qualificação no formato de um currículo e esse currículo deve constar o nível de escolaridade
dele assim como registro de todos os cursos que fez, datas de início, fim e carga horária de cada
curso assim como a qual competência o curso se refere. As competências são um registro do
que uma pessoa precisa saber para assumir uma função na empresa. Cada função deverá ter
suas competências associadas. Por exemplo, um gestor deve ter a competência “gerência de
pessoas”.

## Relatorios:
1. Gerar um relatório com a listagem de todos os funcionários, locais de trabalho, suas
funções e se o laudo da última consulta ocupacional considerou ele “APTO” ou não para
trabalhar.

2. Gerar um relatório com os dados dos funcionários aptos para o trabalho (conforme
laudo), com seu estado civil, lista de dependentes (se tiver), se é doador de órgãos e o
último valor do registro da glicose no sistema.

3. Listar todos os funcionários, indicando sua escolaridade, sua função e se estão ou não
com as competências necessárias para a função que exercem.

4. Listar mês a mês que funcionários estarão iniciando férias, mostrando o percentual (%)
de funcionários de férias no setor.
