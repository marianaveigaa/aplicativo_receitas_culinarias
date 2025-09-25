# App de Receitas Culinárias - Fluxo de Primeira Execução

## 📚 Visão Geral do Projeto

Este projeto, desenvolvido para a disciplina de Desenvolvimento de Aplicações para Dispositivos Móveis, é uma implementação completa e robusta do fluxo de primeira execução de um aplicativo em Flutter.

A aplicação foi evoluída para incluir não apenas uma interface de boas-vindas visualmente agradável, mas também uma lógica inteligente que personaliza a experiência do usuário desde o primeiro acesso, utilizando persistência de dados local.

O fluxo implementado consiste em:
1.  **Launch Screen Nativa:** Uma tela de abertura profissional para uma excelente primeira impressão.
2.  **Splash Screen Inteligente:** Uma tela de carregamento que verifica se o usuário já viu o onboarding e o direciona para a tela correta.
3.  **Onboarding Interativo de 4 Páginas:** Uma sequência de telas que apresenta o app, explica seu funcionamento, coleta o consentimento de marketing (preparação para LGPD) e finaliza o processo.
4.  **Persistência de Dados:** Uso de `SharedPreferences` para "lembrar" as escolhas do usuário e garantir que o onboarding seja exibido apenas uma vez.

**Tema Escolhido:** Receitas Culinárias.

---

## 🛠️ Tecnologias e Widgets Utilizados

A seguir, uma lista das principais ferramentas e conceitos aplicados neste projeto:

* **`shared_preferences`**: Pacote essencial para persistência de dados local. Usado para salvar se o onboarding foi concluído e a preferência de marketing do usuário.
* **`dots_indicator`**: Biblioteca utilizada para criar o indicador de progresso visual (`DotsIndicator`) durante o onboarding, melhorando a clareza e a UX.
* **`Future`, `async`, `await`**: Conceitos fundamentais de programação assíncrona, utilizados na Splash Screen para ler os dados do `SharedPreferences` sem travar a interface.
* **`flutter_native_splash`**: Pacote para a criação da launch screen nativa, eliminando a "tela branca" inicial.
* **`StatefulWidget`**: Utilizado para gerenciar estados complexos, como a página atual do onboarding e a escolha do usuário na tela de consentimento.
* **Rotas Nomeadas (`MaterialApp`)**: Estrutura de navegação centralizada para um fluxo explícito e de fácil manutenção (`/`, `/onboarding`, `/home`).
* **`Navigator.pushReplacementNamed`**: Método de navegação que garante um fluxo unidirecional, impedindo que o usuário retorne para as telas de introdução.
* **`PageView` com `PageController`**: Componentes centrais para a criação do carrossel de onboarding.
* **`Visibility`**: Widget crucial para implementar os **controles contextuais**, mostrando ou ocultando botões como "Pular" e "Voltar" apenas quando fazem sentido na jornada do usuário.
* **`ClipRRect`**: Utilizado para aplicar bordas arredondadas às imagens, conferindo um design mais moderno à interface.

---

## 🚀 Como Executar o Projeto

Para executar este projeto localmente, siga os passos abaixo:

**Pré-requisitos:**
* Ter o Flutter SDK (versão estável mais recente) instalado.
* Ter um emulador Android/iOS configurado ou um dispositivo físico conectado.
* Ter o Google Chrome para rodar a versão web.

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

4.  **Gere a Splash Screen Nativa (se necessário):**
    ```bash
    flutter pub run flutter_native_splash:create
    ```

5.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```
    *Para executar especificamente no Chrome (recomendado):*
    ```bash
    flutter run -d chrome --web-renderer html
    ```
---

## 👩🏻‍💻 Feito Por: 👨🏻‍💻

* Mariana Veiga Dos Santos
* Vitor Thomé
* João Vitor Herzer De Sousa
