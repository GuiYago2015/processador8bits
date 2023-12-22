# Processador de 8 bits em Verilog

Este projeto foi inicialmente proposto como um desafio de implementação de um processador de 8 bits em Verilog. O processador foi projetado com o objetivo específico de executar um programa de ordenação de vetor, desenvolvido em uma linguagem de assembly própria. Abaixo estão os principais componentes e características do processador:

### Características Principais:

- **Arquitetura de 8 bits:**
  O processador opera em uma arquitetura de 8 bits, atendendo ao desafio inicial do projeto.
  
- **Unidade Lógico-Aritmética (ULA):**
  A ULA incorpora operações de soma, subtração e comparação, fundamentais para as operações básicas e de controle do fluxo do programa.

- **Banco de Registradores de 8 Registradores:**
  O processador possui um banco de registradores com capacidade para armazenar 8 registradores visíveis ao programador, além de 2 registradores internos que contribuem para o funcionamento interno do processador.

- **Memória de Instrução e Dados:**
  Duas memórias distintas são utilizadas - uma para armazenar instruções e outra para dados. A memória de instrução é responsável por armazenar as instruções específicas do programa de ordenação de vetor.

- **Caminho de Dados:**
  O processador segue um caminho de dados cuidadosamente projetado, determinando a rota dos dados entre os diferentes componentes para garantir a execução eficiente das instruções e otimização do desempenho do processador.
