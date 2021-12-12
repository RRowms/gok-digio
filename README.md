# Digio iOS Developer Test

Projeto construído buscando atender todas especificações de requisitos técnicos, regras, bônus e adicionais esperados. Ou ao menos demonstrar conhecimento com exemplos de código sobre os conceitos e práticas solicitadas.

Decisão por utilizar projeto nativo criado no Xcode, sem libs nem frameworks, levando em consideração a reunião dos requisitos. Com isso basta abrir o digio.xcodeproj no Xcode 13.1 para rodar o build e respectivos testes.

Histórico de commits demonstram a estruturação das etapas de desenvolvimento:

- Criação do projeto para deploy em iOS 12, com respectivos ajustes nos scripts padrão criados pelo Xcode;
- Instalação e configuração do SwiftLint para garantir qualidade de código;
- Criação da tela Home com Autolayout adicionando Scroll para melhor exibição em Widescreen e outros tamanhos de telas/dispositivos;
- Implementação de CollectionViews para melhor controle de padrões visuais já com a leitura das imagens vindas do serviço;
- Criação do visual com Autolayout da tela de Detalhes já sendo chamada pelas células dos produtos e já passando os dados a serem exibidos;
- Implementação de requisição por URLSession montando a estrutura de dados com base no Json do servidor;
- Refactoring das classes de validação de url para aplicação de tratamento de erros, adicionando alertas para o usuário caso algo dê errado;
- Aplicação adicional de monitor de acesso à internet para alerta ao usuário, já que a aplicação depende do serviço para exibir as informações mínimas;
- Validar se a resposta de dados está correta em caso de URL válida, mas com Json diferente do esperado, adicional alerta para usuário;
- Utilização de crash image caso a URL da foto fornecida pela API esteja quebrada, mas seguir com o funcionamento normal da aplicação;
- Refactoring de Classes e Extensões para implementação de testes unitários, como validação de url, Controlador de Acesso à API de serviço e monitor de internet;
- Adicional implementação de exemplo de UI Test da tela de Detalhes, se os elementos aparecem corretamente como esperado;
- Retoque final com a inserção de ícone do aplicativo.

Agradeço a oportunidade e aprendizado com o projeto trabalhado.

Espero que gostem!

