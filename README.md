# Rede Neural BackPropagation com Generalizacao

Utilizando a rede neural Backpropagation para generalizar a resposta adaptativa da rede em um circuito RLC.

IFPB/PB, Joao Pessoa, 22/04/2018.
PROJETO DE REDES NEURAIS SEM REALIMENTACÄO
ARQUITETURA: REDE MLP - Multilayer Perceptron
CONFIGURACÄO: UMA CAMADA OCULTA - UM NEURÔNIO DE SAÍDA LINEAR
ALGORITMO: BackProgation
APLICACAO: Aproximaçäo de Funçöes
AUTOR: Mestrando Arthur Medeiros Guimarães
 
Circuito RL
Fonte: 5 V
Resistencia: 10, 7.5 e 5 homs
Resistencia da generalização: 8.75 e 6.25 homs
Indutor: 1 Henry
Tempo da simulação do circuito RL: 0,5 seg


## Como Funciona uma Rede Neural?

Esse é um assunto bastante complexo e para explicar, seria necessario algumas aulas para explicar ela mais a fundo, entretanto vou fazer um resumo para que possa se situar no código.

Uma rede neural é um conjunto de neurônios. Nesse caso os neurônios são formulas matematicas que visam imitar as caracteristicas dos neurônios de um celebro humano e sua interações.

O perceptron é o neuronio digital (ou seja, todo seu conjunto de equações) mais famoso que temos, atualmente. 

A rede neural utilizada nesse código é a backpropagation, uma rede neural baseada em perceptron.

O coração de uma rede neural como a backpropagation são os seus pesos sinapticos. Eles são responsaveis por toda a comunicação entre os neuronios e é quem delimita a relevancia de cada informação que entra no neurônio.

Uma rede neural possui um periodo de treinamento, no qual você entrega a rede um conjunto de dados ja classificados, para que a mesma entre em um periodo de treinamento.

Após a fase de treinamento estar concluída, a rede esta pronta para entrar em ação com um conjunto de dados reais. Mas detalhe, esse conjunto de dados reais tem de ser homogêneo com o os dados do treinamento. Aliás, não adianta você treinar uma rede com maçãs e abacaxis e depois mostrar apenas melâncias e peras a ela, a rede vai errar.

Aqui esta uma foto de uma rede neural treinada com 25300 épocas, generalizando suas informações para um circuito RLC.

![imagem](https://github.com/Arthurmgwork/Rede-Neural-BackPropagation-com-Generalizacao/blob/main/imagem-treinamento.JPG)

## Ué, mas só isso? Sem nenhum PDF com projetinho dessa vez?

"Por enquanto não", pois esse código implementa as equações do zero de uma rede neural backpropagation, com base no livro dos haupt. Algo que é inviavel nos tempos atuais. O mais comum é ser utilizado uma biblioteca especifica para isso como o keras e o tensorflow do python.

Inclusive eu mesmo ja migrei para ambas as bibliotecas (keras e tensorflow) e posso afirmar que facilitou muito o tempo de programação e a utilização em si das redes neurais. Estou pensando em um trabalho utilizando o keras e tensorflow com uma espcam para servir de reconhecimento facial. Mas isso esta nos meus planos, eu encomendei uma espcam para começar os testes e estou esperando chegar. No futuro espero poder trazer um projeto completo e mais compativel com o mercado.


