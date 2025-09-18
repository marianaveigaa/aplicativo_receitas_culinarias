# App de Receitas Culinárias - Fluxo Inicial

## 📚 Visão Geral do Projeto

Este projeto foi desenvolvido como parte da Atividade Integrada 4 para a disciplina de Desenvolvimento de Aplicações para Dispositivos Móveis. O objetivo é implementar o fluxo inicial completo de um aplicativo em Flutter, seguindo as melhores práticas de UX/UI e estabelecendo as bases para conformidade com a LGPD.

O fluxo implementado consiste em três etapas principais:
1.  **Launch Screen Nativa:** Uma tela de abertura profissional que melhora a primeira impressão do usuário.
2.  **Splash Screen (Flutter):** Uma tela de carregamento com a identidade visual do app.
3.  **Onboarding Interativo:** Uma sequência de duas telas de boas-vindas que o usuário pode navegar por gestos.

**Tema Escolhido:** Receitas Culinárias.

---

## 🛠️ Tecnologias e Widgets Utilizados

A seguir, uma lista das principais ferramentas e widgets do Flutter que foram essenciais para a construção deste projeto:

* **`flutter_native_splash`**: Pacote utilizado para criar a launch screen nativa, eliminando a "tela branca" inicial e proporcionando uma experiência de carregamento mais profissional.
* **`StatefulWidget`**: Usado na Splash Screen e na Onboarding Screen para gerenciar estados internos, como o timer de navegação e a página atual do carrossel.
* **Rotas Nomeadas (`MaterialApp`)**: Toda a navegação foi estruturada com rotas nomeadas (`/`, `/onboarding`, `/home`) para tornar o fluxo explícito e fácil de manter.
* **`Navigator.pushReplacementNamed`**: Método de navegação utilizado para garantir um fluxo unidirecional, impedindo que o usuário retorne para as telas de Splash e Onboarding.
* **`PageView` com `PageController`**: Componentes centrais para a criação do carrossel de onboarding interativo, permitindo a navegação por gestos de swipe.
* **Layouts Essenciais (`Scaffold`, `SafeArea`, `Padding`)**: Estrutura base para garantir que a UI se adapte a diferentes telas e evite áreas como notches e barras de sistema, além de manter um espaçamento visualmente agradável.
* **`ClipRRect`**: Widget utilizado para aplicar bordas arredondadas às imagens, conferindo um design mais moderno e profissional à interface.

---

## 🚀 Como Executar o Projeto

Para executar este projeto localmente, siga os passos abaixo:

**Pré-requisitos:**
* Ter o Flutter SDK instalado.
* Ter um emulador Android/iOS configurado ou um dispositivo físico conectado.
* Alternativamente, ter o Google Chrome para rodar a versão web.

**Passos:**

1.  **Clone o repositório:**
    ```bash
    git clone [URL_DO_SEU_REPOSITORIO_AQUI]
    ```

2.  **Acesse o diretório do projeto:**
    ```bash
    cd nome-do-projeto
    ```

3.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

4.  **Gere a Splash Screen Nativa:**
    ```bash
    flutter pub run flutter_native_splash:create
    ```

5.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```
    *Para executar especificamente no Chrome:*
    ```bash
    flutter run -d chrome
    ```

---

## 🧑‍💻 Equipe

* [Seu Nome Completo]
* [Nome do Integrante 2]
* [Nome do Integrante 3]
* [Nome do Integrante 4]
* [Nome do Integrante 5]
