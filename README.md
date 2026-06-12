# Login Teste

Aplicativo Flutter simples de demonstração contendo telas de Login, Home e Cadastro.

## Funcionalidades

- **Tela inicial (MyHomePage):** botão para acessar a tela de login.
- **Login:** valida usuário e senha fixos (`4rthur` / `13567`). Exibe mensagens de erro via `SnackBar` para campos vazios ou credenciais incorretas, e navega para a Home em caso de sucesso.
- **Home:** tela de boas-vindas com botão de acesso à tela de Cadastro.
- **Cadastro:** formulário com campos de Nome, Email e Curso (seleção via `DropdownMenu` com lista de cursos pré-definidos). Valida campos vazios e formato de email (verificação do `@`).

## Estrutura de arquivos

```
lib/
├── main.dart      # Ponto de entrada do app e tela inicial
├── login.dart     # Tela de login
├── home.dart      # Tela home
└── cadastro.dart  # Tela de cadastro
```

## Tecnologias

- [Flutter](https://flutter.dev/)
- Material Design (`ThemeData`, `ColorScheme.fromSeed`)

## Como executar

1. Certifique-se de ter o Flutter SDK instalado.
2. Clone este repositório.
3. Instale as dependências:

   ```bash
   flutter pub get
   ```

4. Execute o aplicativo:

   ```bash
   flutter run
   ```

## Credenciais de teste

| Usuário | Senha |
|---------|-------|
| 4rthur  | 13567 |

