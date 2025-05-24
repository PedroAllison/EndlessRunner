# Pasta de artefato do projeto final (3.0 pontos)

#  Testes Unitários
Cenário 1: Movimento do Personagem
Descrição: Verificar se o personagem principal corre e salta corretamente.

Itens de Execução:

Testar movimento contínuo horizontal automático.

Testar salto com comando único (barra de espaço ou toque).

Validação: O personagem deve correr continuamente e responder corretamente ao comando de salto.

#Cenário 2: Detecção de Colisão
Descrição: Validar se a colisão entre o personagem e os obstáculos está funcionando corretamente.

Itens de Execução:

Testar colisão com cactos e pássaros.

Testar cenários sem colisão (salto bem-sucedido).

Validação: A colisão deve encerrar o jogo e exibir a tela de “game over” corretamente.

#Cenário 3: Geração de Obstáculos
Descrição: Verificar se os obstáculos aparecem em intervalos e posições coerentes.

Itens de Execução:

Medir frequência de geração de obstáculos.

Validar variação entre tipos de obstáculos.

Validação: Obstáculos devem aparecer de forma randômica e em distâncias razoáveis para permitir reação do jogador.

#Cenário 4: Sistema de Pontuação
Descrição: Garantir que o sistema de pontuação acumule pontos com o tempo.

Itens de Execução:

Verificar incremento contínuo de pontos.

Testar reset de pontuação após reinício do jogo.

Validação: A pontuação deve aumentar com o tempo e reiniciar corretamente após falha.

#Cenário 5: Aumento de Dificuldade
Descrição: Verificar se a dificuldade aumenta gradualmente com o tempo.

Itens de Execução:

Medir aumento de velocidade de corrida após determinados pontos.

Avaliar introdução de novos obstáculos com o progresso.

Validação: A velocidade deve aumentar de forma perceptível após certo tempo e novos obstáculos devem ser introduzidos.


#  Testes de Usabilidade
Cenário 1: Início Rápido da Partida
Descrição: Avaliar se o jogador consegue iniciar a partida de forma intuitiva.
Itens de Execução:

Jogador tenta iniciar o jogo sem instruções.

Identificar se o jogador reconhece o comando de início (barra de espaço/toque).

Validação: O usuário deve conseguir iniciar o jogo sem precisar de tutorial.

#Cenário 2: Clareza Visual dos Obstáculos
Descrição: Verificar se os obstáculos são claramente visíveis e distinguíveis.

Itens de Execução:

Jogador observa diferentes tipos de obstáculos.

Avaliar contraste com o fundo e legibilidade.

Validação: Obstáculos devem ser fáceis de identificar e diferenciar em movimento.

#Cenário 3: Feedback de Colisão
Descrição: Avaliar se o jogador entende que perdeu e por quê.

Itens de Execução:

Jogador colide com obstáculo.

Observar clareza do feedback visual e sonoro.

Validação: Feedback de "game over" deve ser imediato e compreensível.

#Cenário 4: Reinício do Jogo
Descrição: Avaliar se o jogador consegue reiniciar o jogo facilmente.

Itens de Execução:

Jogador tenta reiniciar após perder.

Verificar se botão ou comando para reinício é intuitivo.

Validação: O jogador deve conseguir reiniciar a partida sem dificuldade.

#Cenário 5: Acessibilidade de Controles
Descrição: Avaliar se os controles funcionam bem em diferentes dispositivos.

Itens de Execução:

Testar em desktop (teclado) e controle (controle).

Verificar responsividade de comandos.

Validação: Os controles devem funcionar corretamente em todas as plataformas.

 # Testes de Performance
#Cenário 1: Desempenho Contínuo por Longo Período
Descrição: Avaliar estabilidade do jogo após longos períodos de execução.

Itens de Execução:

Rodar o jogo por 1 minutos ininterruptos.

Monitorar uso de memória e CPU.

Validação: O jogo deve se manter estável, sem quedas de desempenho ou travamentos.

#Cenário 2: Carregamento Inicial
Descrição: Verificar o tempo necessário para o jogo estar pronto após o carregamento.

Itens de Execução:

Medir o tempo desde o carregamento da página até o primeiro input possível.

Validação: O jogo deve estar totalmente jogável em menos de 3 segundos após o carregamento.

Conclusão
Este documento define uma base para validar o funcionamento correto, a experiência do usuário e a estabilidade de um jogo estilo "dinossauro offline". A adoção desses testes ajuda a garantir uma jogabilidade fluida, simples e sem frustrações.
