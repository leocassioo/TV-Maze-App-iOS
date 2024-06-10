## Descrição Geral

Este projeto consiste em um aplicativo iOS desenvolvido para explorar informações sobre shows de TV, utilizando a API fornecida pelo TVMaze. O aplicativo foi desenvolvido com foco em seguir os melhores padrões de arquitetura e práticas de mercado.

## Arquitetura e Boas Práticas

- **Arquitetura VIP-C**: O aplicativo foi desenvolvido utilizando a arquitetura VIP-C (View, Interactor, Presenter, Coordinator), o que garante uma separação clara de responsabilidades e facilita a manutenção e escalabilidade do código.
- **Práticas de SOLID e Clean Code**: Foram seguidas rigorosamente as práticas de SOLID e Clean Code, garantindo um código desacoplado, simples, de fácil manutenção e objetivo.
- **Padrões de Design**: Foram utilizados padrões de design comuns de mercado, incluindo:
  - **Singleton**: Para garantir uma única instância do `NetworkService`.
  - **Dependency Injection**: Para facilitar o teste e a troca de dependências.
  - **Factory Method**: Para criação dos construtores de rede (`NetworkConstructor`).
  - **Observer**: Implementado através do protocolo `Delegate`, utilizado para comunicação entre o `Presenter` e a `View`.
- **ViewCode**: desenvolvido 100% com swift e viewCode

## Funcionalidades Implementadas

1. **Tela de Busca**:
   - Contém uma caixa de busca onde o usuário pode digitar o nome do show.
   - Exibe uma lista dos shows correspondentes ao texto digitado, incluindo título, status e pôster.
   - O status dos shows que já terminaram é destacado em vermelho e em negrito.

2. **Tela de Detalhes**:
   - Exibe o título, pôster, resumo, classificação e uma lista de aliases do show selecionado.
   - Adição dos gêneros do programa.
   - Adição da lista de elenco com uma collectionview, contendo foto, nome real e nome na atuacao do programa

## Requisitos do Projeto

- **Requisitos do projeto**: Todos os requisitos previstos foram implementados, incluindo:
  1. Informações dos shows na lista da primeira tela (título, status e pôster).
  2. Destaque do status dos shows que já terminaram.
  3. Tela de detalhes com título, pôster, resumo, classificação e lista de aliases.
  4. Funcionamento tanto no modo retrato quanto no modo paisagem.
  5. Desenvolvimento em Swift.

- **Funcionalidades Bônus**:
  1. Implementação de testes unitários para todas as telas que contêm regras de negócio.
  2. Implementação de testes de view utilizando a biblioteca swift-snapshot-testing (caso sejam executados, estão baseados no iPhone da linha Pro, pelo tamanho: 13 Pro, 14 Pro, 15 Pro).

## Testes

- **Testes Unitários**: Foram realizados testes unitários para garantir o correto funcionamento das regras de negócio.
- **Testes de View**: Utilização da biblioteca swift-snapshot-testing para realizar testes de view, garantindo que as interfaces estejam de acordo com o esperado (caso sejam executados, estão baseados no iPhone da linha Pro, pelo tamanho: 13 Pro, 14 Pro, 15 Pro).

## Usabilidade

- **Práticas de Mercado e Apple Human Interface Guidelines**: Para melhorar a usabilidade do aplicativo, foram implementadas práticas de mercado e itens que seguem o Apple Human Interface Guidelines, proporcionando uma experiência de usuário intuitiva e agradável.

## Dependências do Projeto

- **SnapKit**: Utilizado para facilitar e agilizar o desenvolvimento das constraints das views.
- **swift-snapshot-testing**: Utilizado para realizar testes de view.
- **Swift Package Manager**: Todas as dependências foram gerenciadas utilizando o Swift Package Manager, facilitando a integração e manutenção do projeto.

## Considerações Finais

O desenvolvimento deste aplicativo seguiu rigorosamente as boas práticas de desenvolvimento, utilizando uma arquitetura robusta e práticas de código que garantem um código limpo e fácil de manter. A adição de testes unitários e de view reforça o compromisso com a qualidade do código.

## Melhorias Futuras

Há potencial para melhorias no projeto, incluindo a exibição de detalhes mais ricos e a adição de mais features. No entanto, a API fornecida atualmente não possui recursos de paginação, recursos de autocomplete para a busca, entre outros detalhes técnicos, o que limita algumas implementações mais avançadas.

## Contato

- **Telefone**: (31) 98355-8266
- **Email**: [leocassio.af@gmail.com](mailto:leocassio.af@gmail.com)
- **LinkedIn**: [Perfil no LinkedIn](https://www.linkedin.com/in/leocassioo) - https://www.linkedin.com/in/leocassioo

## Adicionais
**Funcionamento**: https://drive.google.com/file/d/1MVyoQA14rbsWvdlS57l1apyk2eyOWAiX/view?usp=sharing

![image](https://github.com/leocassioo/TV-Maze-App-iOS/assets/16023720/b465b677-dd7f-4192-9f05-25880a2e12c9)
![image](https://github.com/leocassioo/TV-Maze-App-iOS/assets/16023720/a716e372-5cbb-4a83-8d02-23efb15d047d)
![image](https://github.com/leocassioo/TV-Maze-App-iOS/assets/16023720/9b5ad0fc-1194-4d13-809b-cbd27dc053d3)
![image](https://github.com/leocassioo/TV-Maze-App-iOS/assets/16023720/c69e7604-5656-4f92-8b63-648f5a82154c)


**Cobertura de testes**:

![image](https://github.com/leocassioo/TV-Maze-App-iOS/assets/16023720/e7dd0773-c98c-4122-9221-5229e39e64df)

**Cobertura de testes de view**: esses ficam dentro dos diretorios de testes (TV Maze App/TV Maze AppTests/Patch/__Snapshots__/ViewControllerTestCase/test_ControllerSnapshot_Withxxxx.1.png

![image](https://github.com/leocassioo/TV-Maze-App-iOS/assets/16023720/8baf2023-95d2-47f1-96f7-aedce63c6e90)

