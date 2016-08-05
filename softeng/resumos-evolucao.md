---
layout: page
title: "Resumos de artigos sobre evolução de software"
---

Resumos elaborados durante a disciplina de Evolução de Software da UFCG, turma de 2008, prof. Dalton Serey.

Índice de artigos:

- A Survey of Software Refactoring
- Automatic Generation of Suggestions for Program Investigation
- Bunch, A Clustering Tool for the Recovery and Maintenance of Software System Structures
- Efficient and Precise Dynamic Impact Analysis Using Execute-After Sequences
- Future Trends in Software Evolution Metrics
- Mining Version Histories to Guide Software Changes
- Reconstruction of Successful Software Evolution Using Clone Detection
- SNIAFL, Towards a Static Non-Interactive Approach to Feature Location
- Software Maintenance and Evolution, a Roadmap
- Two Case Studies of Open Source Software Development, Apache and Mozilla
- Visualizing Software Changes

Slides:

- Diff estrutural de versões de programas [(pdf)](Rodrigo Rocha - Diff estrutural de versoes de programas.pdf)
- Envelhecimento de software [(pdf)](Rodrigo Rocha - Envelhecimento de software.pdf)

## A Survey of Software Refactoring

### Resumo

O texto apresenta avanços e problemas em aberto na área de refatoração de software. Ele aborda atividades envolvidas na refatoração, formalismos e técnicas que as apóiam, ferramentas que as automatizam. Por fim, discute como a refatoração se encaixa em processos de desenvolvimento de software.

Refatoração é a reestruturação de um programa OO com o objetivo de reduzir a complexidade de um programa sem, no entanto, alterar seu comportamento externo. Atividades envolvidas nesse processo incluem identificar porções de código que devem ser refatoradas, garantir que as transformações aplicadas no código preservam seu comportamento e medir o benefício da refatoração na qualidade do software. O artigo dá ênfase a técnicas usadas para garantir a preservação do comportamento.

### Referência

Tom Mens, Tom Tourwe, "A Survey of Software Refactoring," IEEE Transactions on Software Engineering, Vol. 30, No. 2, February 2004, pp. 126-139.

## Automatic Generation of Suggestions for Program Investigation

### Resumo

O artigo apresenta uma técnica para sugerir automaticamente a um desenvolvedor elementos de código que ele deve compreender para executar uma tarefa de manutenção. A entrada para o algoritmo é um conjunto nebuloso de elementos julgados interessantes pelo desenvolvedor e a saída é um conjunto nebuloso de elementos relacionados potencialmente interessantes. O peso de cada elemento no conjunto nebuloso sugerido pelo algoritmo depende de sua especificidade e de seu reforço (definidos no artigo).

A técnica foi avaliada quantitativa- e qualitativamente com base em experimentos com os programas JHotDraw e Azureus. Os resultados expressam a precisão da técnica, mas não a sua revocação.

### Crítica

A ferramenta desenvolvida chama-se Suade e está disponível no endereço http://www.cs.mcgill.ca/~swevo/suade/

Este trabalho complementa a abordagem de Zimmermann e Ying para sugestão automática. Enquanto esta última usa informações de repositórios de software, a abordagem aqui discutida usa relacionamentos entre elementos obtidos por análise estática.

### Referência

M.P. Robillard. [http://doi.acm.org/10.1145/1095430.1081711 Automatic Generation of Suggestions for Program Investigation]. In Proceedings of the Joint European Software Engineering Conference and ACM SIGSOFT Symposium on the Foundations of Software Engineering, 2005

## Bunch, A Clustering Tool for the Recovery and Maintenance of Software System Structures

### Resumo

Com a finalidade de auxiliar a compreensão de programas, a ferramenta Bunch particiona em clusters o conjunto de módulos de um programa (arquivos ou classes) de acordo com os relacionamentos existentes entre eles. O particionamento é guiado por uma métrica de qualidade de modularização (MQ), que recompensa a criação de clusters com módulos acoplados e penaliza o acoplamento entre módulos de clusters diferentes. Encontrar uma partição com MQ ótimo é um problema intratável; por isso a ferramenta usa heurísticas como algoritmos genéticos e hill-climbing para obter resultados sub-ótimos.

Após uma rodada de avaliação, os autores do Bunch identificaram 3 limitações da ferramenta:
* ela não identifica módulos onipresentes (módulos com muitos relacionamentos, que não se encaixam naturalmente em nenhum cluster;
* ela não aceita palpites de usuários ao particionar o programa analisado;
* pequenas mudanças no programa tendem a alterar radicalmente o particionamento da ferramenta.

Para solucionar esses problemas, a ferramenta passou a...
* ... identificar e agrupar módulos onipresentes em um cluster;
* ... aceitar clusters criados pelos usuários;
* ... ao processar uma nova versão de um programa, receber como entrada o particionamento da versão anterior e atualizá-lo distribuindo os novos módulos entre os clusters existentes.

O artigo mostra a aplicação na nova versão de Bunch no programa GraphViz e sugere como trabalho futuro a avaliação das novas funcionalidades.

### Crítica

A técnica usada pelo Bunch é bastante interessante e as novas funcionalidades melhoram a ferramenta. Como apontado pelos autores, no entanto, as soluções para os problemas levantados precisam ser avaliadas.

O novo Bunch aceita que os usuários criem alguns clusters. Seria interessante avaliar se a intervenção dos usuários em geral melhora ou piora a MQ. Se piora, seria interessante investigar que critérios os usuários utilizam para criar seus clusters e como isso pode ser incorporado à ferramenta.

A solução para a instabilidade do Bunch em versões distintas de um programa precisa amadurecer. A solução atual assume que todas as versões de um programa possuem a mesma estrutura de alto nível, e não detecta situações em que faz sentido criar novos clusters. Em outras palavras, a solução adotada é muito estável, mesmo quando a evolução estrutural do programa sob análise é instável.

### Referência
Mancoridis et al. 1999. Bunch: A Clustering Tool for the Recovery and Maintenance of Software System Structures. In Proceedings of International Conference of Software Maintenance


---

(rascunho)

A representação de programas usada pelo Bunch é a de grafo não-ponderado.
Em outras palavras, ele não leva em conta a quantidade de vezes que duas
entidades estão relacionadas de acordo com uma mesma relação.

Reduz o problema de identificação de subsistemas ao problema de particionar
um grafo otimizando uma função que recompensa acoplamento intra-subsistema
e penaliza acoplamento inter-subsistemas.

Bunch fornece respostas sub-ótimas a esse problema intratável usando
hill-climbing e algoritmos genéticos.

Limitações:
- não identifica módulos onipresentes (clientes ou fornecedores)
  - solução: um subsistema pra clientes e um para fornecedores
- não considera conhecimento tácito do desenvolvedor
- pequenas alterações estruturais causam alterações significativas no
particionamento


IDÉIA (análise dinâmica): Instrumentar chamadas de um programa com AspectJ,
capturando chamador e chamado. Calcular fecho transitivo do relação "chamar".
Usar essa informação para calcular clusters.

Críticas:
Novo Bunch leva em conta clusterização de usuários. O MQ reflete a intuição do usuário ao clusterizar?
Bunch ainda não lida bem com a evolução de programas. E se novas versões sugerem novos particionamentos? É preciso levar em conta o particionamento anterior, mas ainda assim esse particionamento deve mudar radicalmente se a estrutura do programa muda radicalmente.
O Bunch podia tentar sugerir nomes para os clusters

Eles estão adaptando o Bunch pra ser executado em paralelo numa rede de computadores

---

## Efficient and Precise Dynamic Impact Analysis Using Execute-After Sequences

### Resumo

O artigo propõe uma nova técnica de análise de impacto baseada em instrumentação de código, chamada CollectEA, e a compara com as técnicas PathImpact e CoverageImpact. Seu tempo de execução é proporcional ao número de chamadas a métodos em uma execução do programa analisado; a quantidade de memória usada é proporcional à quantidade de métodos do programa.

Tendo sido identificado um método M que foi ou será alterado, o algoritmo CollectEA executa o programa instrumentado e identifica como conjunto de impacto o conjunto de métodos que são executados após M. Se forem analisadas múltiplas execuções do programa, o conjunto de impacto é a união dos conjuntos de impactos calculados para cada execução. Além disso, a técnica pode ser usada em programas com múltiplas threads.

Os autores experimentaram o CollectEA, o CoverageImpact e o PathImpact em dois projetos, usando execuções originadas de testes de unidade. Os resultados mostraram que o CollectEA é tão preciso quanto o PathImpact e possui requisitos de tempo e espaço apenas um pouco maiores do que aqueles exigidos pelo CoverageImpact.

### Crítica

Os autores dão a entender que sua técnica computa um superconjunto do conjunto de impacto de uma mudança nas execuções consideradas, no entanto não justificam essa afirmação. Essa hipótese é inclusive usada na análise dos resultados dos experimentos. Os autores assumem que, quanto menor é o conjunto de impacto calculado por uma das três técnicas citadas no artigo, maior é a precisão. Naturalmente, isso só é válido se as três técnicas encontram a mesma quantidade de entidades realmente impactadas.

CollectEA pode ser usado em programas OO, mas não leva em consideração estruturas como classes, interfaces e atributos. Técnicas que levem em conta características da programação OO podem ser mais precisas e analisar outros tipos de mudança, como a alteração do tipo de um atributo (esse tipo de impacto, no entanto, é capturado pelo JDiff, algoritmo desenvolvido pelos mesmos autores).

## Future Trends in Software Evolution Metrics

O artigo classifica os usos de métrica na pesquisa em evolução de software e destaca tópicos de pesquisa que precisam ser desenvolvidos.

O uso de métricas pode ser preditivo ou retrospectivo. No primeiro caso, é usado para identificar partes de um programa que necessitam de evolução (por exemplo, refactorings em trechos do programa com estrutura ruim), detectar módulos que provavelmente serão evoluídos (analisando o histórico recente de mudanças) ou identificar módulos que causam grande impacto quando evoluídos.

Pode-se por outro lado, aplicar métricas de maneira retrospectiva, analisando o histórico de um software. Com isso pode-se aferir de que maneira o software evoluiu ao longo do tempo -- por exemplo associando práticas de desenvolvimento a medidas de qualidade de software ou ainda detectando quando houve reestruturação e quando houve extensão do software.

Os autores identificam alguns desafios no estudo de evolução de software baseado em métricas, dentre os quais pode-se destacar os seguintes:

- faltam boas métricas de coesão e acoplamento
- é difícil medir qualidade de software
- há muito o que ser explorado na área de visualização


-------------------

(rascunho)


Uso de métricas pode ser preditivo ou retrospectivo.
Preditivo
 evolution-critical, -prone, -sensitive

evolution-critical: partes que precisam ser evoluídas por possuírem baixa qualidade.

- Refactorings.
- Identificar código duplicado
- Identificar código incompleto (classes abstratas leaf)
- Detectar código obsoleto (código que não é usado. Problema: very late binding. Solução: análise dinâmica)

evolution-prone: provável evolução;
  módulos instáveis num passado recente

evolution-sensitive: uma mudança nesse módulo causa grande impacto no código;
  acoplamento

Retrospectivo: analisa se a estrutura ou a qualidade mudou;
  Tipo de evolução (reestruturadora, extensora)

Futuro

- métricas de acoplameneto e coesão
- visualização: ajuda o pesquisador a escolher o que explorar
- métricas de qualidade
- como o processo afeta o desenvolvimento
- independência de linguagem

----

## Mining Version Histories to Guide Software Changes

Os autores usam mineração de dados do histórico de versões de um software e análise sintática para recomendar alterações relacionadas a alterações realizadas por um programador. As recomendações podem ser no nível de arquivo ou mesmo classe, método ou atributo.

Por usar o histórico, a ferramenta consegue detectar relações não-detectáveis por técnicas de análise estática ou dinâmica. Outra vantagem é que ela pode ser facilmente aplicada a qualquer linguagem de programação (nesse caso detecta relações no nível de arquivo).

A ferramenta é avaliada com base nas métricas precisão, revocação e likelihood. São realizados experimentos que simulam o uso da ferramenta para navegação de código e prevenção de erros. Os experimentos consideraram 8 projetos de código aberto. (Os autores conjecturam que em processos de desenvolvimento mais estritos os resultados seriam melhores.) Os melhores resultados foram obtidos com o software GCC, por ser um projeto mais estável, sem grandes adições de funcionalidade.

Um dos experimentos avalia que ao prever relacões apenas no nível de arquivo, a revocação aumenta. Por outro lado, as recomendações são menos úteis, já que os programadores precisam procurar no arquivo que entidades devem ser modificadas.
## Reconstruction of Successful Software Evolution Using Clone Detection

### Resumo

O artigo aparentemente faz parte de um projeto maior que estuda a evolução de ''softwares'' bem sucedidos a fim de descobrir lições que podem ser aplicadas a outros ''softwares''. No artigo a característica avaliada é a duplicação de código e o ''software'' estudado é o servidor ''web'' Tomcat. A conclusão do estudo é que, ao menos no caso do Tomcat, a remoção de código duplicado não é uma grande preocupação -- os desenvolvedores se dedicam mais a agrupar funcionalidades.

### Crítica

Analisar o histórico de projetos bem sucedidos parece uma boa idéia. No entanto o artigo analisou apenas um projeto, o que ameaça a validade dos experimentos. Se extrapolarmos os resultados experimentais, concluímos que duplicação de código não é especialmente prejudicial para o sucesso de um projeto e, assim, não vale a pena aplicar refactorings para reduzir a duplicação. Essa é uma conclusão perigosa, que contraria a motivação de trabalhos de detecção de código duplicado.

### Referência

Filip Rysselberg, Serge Demeyer, "Reconstruction of Successful Software Evolution Using Clone Detection," Proceedings of the Sixth International Workshop on Principles of Software Evolution (IWPSE’03).  

## SNIAFL, Towards a Static Non-Interactive Approach to Feature Location

### Resumo

O artigo propõe uma abordagem estática e não-interativa para localização de features em código-fonte, denominada SNIAFL. Essa abordagem difere de outras abordagens estáticas --- que dependem de uma pessoa para guiar o processo --- e de abordagens dinâmicas --- que dependem de casos de teste especialmente construídos para a tarefa de localização de features.

Para usar SNIAFL, é preciso ter um parágrafo descritivo sobre cada feature, escrito em linguagem natural. Outra premissa é que os identificadores usados no código-fonte devem ser significativos. SNIAFL primeiramente associa features a funções no código-fonte através de algoritmos de similaridade textual encontrados na área de Recuperação de Informação (RI). Depois disso é feita uma análise estática das relações de chamadas entre funções a fim de estender o conjunto de funções associado a cada feature.

Os autores conduziram um experimento com o sistema GNU DC em que comparavam SNIAFL com uma abordagem dinâmica. SNIAFL alcançou uma revocação média de 99,57% (contra 91,91% da abordagem dinâmica) e precisão média de 90,97% (37,5% no pior caso). A precisão da abordagem dinâmica é sempre 100%.

### Crítica

Gostei bastante da idéia do artigo. A seção de trabalhos relacionados está muito bem escrita e informativa.

Os autores falharam em não apontar uma limitação inerente da análise estática de código: a impossibilidade prática de detectar chamadas que só são conhecidas em tempo de execução (por exemplo, chamada através de ponteiro para função ou através de reflexão/introspecção).

Em um contexto de evolução, SNIAFL pode ser usado para avaliar de que forma a implementação de determinadas features variou no tempo. Uma possível aplicação seria avaliar como refactorings aplicados em um programa afetaram a distribuição de features no código (idealmente, as features devem estar menos espalhadas no código após refactorings).

Um problema relacionado é avaliar a variação do conjunto de features ao longo do tempo. Esse problema, no entanto, não é resolvido pelo SNIAFL, uma vez que ele exige que o conjunto de features seja fornecido pelo usuário.

### Referência

W. Zhao et al. SNIAFL: [http://portal.acm.org/citation.cfm?id=999434 Towards a static non-interactive approach to feature location]. In Proceedings of the 26th International Conference on Software Engineering, 2004.

## Software Maintenance and Evolution, a Roadmap

Software Maintenance and Evolution: A Roadmap
Keith Bennet & Vaclav Rajlich

### Resumo
Tendo como base a hipótese empírica do modelo de estágios de desenvolvimento de software, os autores fornecem um panorama da pesquisa na área de manutenção e evolução de software e projetam o cenário de desenvolvimento de software em dez anos (o artigo foi escrito em 2000). O principal problema de pesquisa da área é o alto custo de se fazer alterações em sistemas de software de porte industrial. Existem oito principais abordagens para tratar esse problema: dinâmica de sistemas, processos de manutenção, estudos sobre a mudança (ex.: análise de impacto), maiores níveis de abstração, compreensão de programas, gerenciamento de negócio, engenharia reversa e validação.

O modelo de estágios divide tempo de vida do software em desenvolvimento inicial, evolução, servicing, phase-out e close-down. A maior parte da pesquisa em software se concentra na primeira fase, que se desenrola até o primeiro release. Na fase de evolução, novos requisitos são incorporados ao sistema de forma a preservar a arquitetura construída no primeiro estágio. Com o tempo a arquitetura se deteriora até um ponto em que apenas pequenas modificações são viáveis, e o software atinge o estágio de servicing. No estágio de phase-out, o software ainda é distribuído mas não é mais mantido e, por fim, no estágio close-down ele é desativado.

A maior dificuldade durante os primeiros estágios do desenvolvimento de um software é prepará-lo para receber mudanças imprevistas – tema de pesquisa da área de arquitetura de software. Já no estágio servicing é comum que os desenvolvedores originais não estejam acessíveis e os desenvolvedores atuais não possuem conhecimento completo do sistema. Nessa situação o recurso crítico é o entendimento do sistema.
Os autores prevêem o crescimento do software como serviço e afirmam que os sistemas cada vez mais serão desenvolvidos como coleções de serviços que podem ser trocados.

### Crítica
Como os autores previram, software como serviço tem sido uma tendência forte atualmente, assim como web services. Duas tendências que os autores não previram são a receita através de publicidade e o software livre.

### Referência
K. H. Bennett, V. T. Rajlich. Software Maintainance and Evolution: A Roadmap. International Conference on Software Engineering. Proceedings..., p. 73-87. Limerick, Ireland, 2000.

## Two Case Studies of Open Source Software Development, Apache and Mozilla

Para avaliar a eficácia de processos de desenvolvimento de software livre, os autores analisam o histórico de mudanças em código-fonte e o sistema de relatório de bugs de dois projetos livres: o servidor web Apache e o navegador Mozilla (atual Firefox). Eles avaliam a influência de fatores como participação, tamanho do time “core” e propriedade de código na produtividade dos desenvolvedores, no tempo de resolução de bugs e na qualidade do software. Com base nos dados são formuladas hipóteses sobre o desenvolvimento de software livre.

Os projetos escolhidos têm algumas diferenças entre si: o Mozilla é muito maior que o Apache (em linhas de código) e pode ser considerado um projeto híbrido entre livre e comercial, pois há alguns desenvolvedores full-time e pagos.

Os autores formulam algumas hipóteses sobre o desenvolvimento de software livre:
* O grupo de desenvolvedores “core” de um projeto, que têm grande conhecimento do código e criam cerca de 80% das funcionalidades, não é maior do que 10 a 15 pessoas – a não ser que sejam adotadas estratégias de coordenação (processos bem definidos, inspeções de código...).
* Em projetos bem sucedidos, o grupo de pessoas que corrigem defeitos é uma ordem de magnitude maior que o grupo que cria funcionalidades; o grupo que relata bugs é uma ordem de magnitude maior do que o grupo que corrige defeitos.
* A densidade de defeitos de projetos de software livre é menor do que a de projetos comerciais dadas as mesmas condições de teste.
* Em projetos bem sucedidos os desenvolvedores são usuários do software desenvolvido.
* Os projetos respondem rápido a problemas dos usuários.

### Crítica
Os autores não se limitam a rotular os processos como software livre: eles se preocupam com os detalhes  de cada processo. Com isso eles conseguem chegar a explicações interessantes para os resultados experimentais. Seria interessante analisar outros projetos para verificar experimentalmente as hipóteses levantadas no artigo.

Quando a pesquisa foi feita, o Mozilla estava se aproximando da versão 1.0. Atualmente, com o Firefox na versão 3.0 e maior base de usuários, os resultados talvez fossem diferentes. Não sei se o processo de desenvolvimento mudou muito, mas certamente a participação da comunidade externa no desenvolvimento e relatório de bugs é muito maior.

### Referência

Audris Mockus, Roy T. Fielding, James D. Herbsleb, "Two Case Studies of Open Source Software Development: Apache and Mozilla," ACM Trans. on Software Engineering and Methodology, Vol. 11, No. 3, July 2002, pp. 309-346.

## Visualizing Software Changes

### Resumo

Visualizações ajudam pessoas a adquirir ''insights'' sobre um objeto de estudo, especialmente se este é representado por um grande volume de dados. Visualizações facilitam a exploração dos dados e apóiam a formulação de questões e hipóteses sobre o objeto estudado.

O artigo mostra como diversas metáforas de visualização podem ser usadas para facilitar a compreensão da evolução de um software e apoiar a tomada de decisões de gerenciamento do processo de desenvolvimento. Os autores interpretam visualizações sobre o histórico de mudanças de um sistema de telefonia com 15 anos de existência.  Eles analisam os pontos fortes e os pontos fracos de cada uma das metáforas visuais usadas -- matrizes, cityscapes, gráficos de barras e gráficos de torta. As metáforas são combinadas em perspectivas onde as operações do usuário sobre uma visão (por exemplo, seleção ou filtragem de elementos) é refletida em todas as visões.

### Crítica

O artigo é uma boa introdução ao tema visualização de ''software'', em particular visualização de mudanças.

### Referência

Stephen G. Eick, Todd L. Graves, Alan F. Karr, Audris Mockus, Paul Schuster, "Visualizing Software Changes," IEEE Trans. Software Engineering, Vol. 28, No. 4, April 2002, pp. 396-412.
