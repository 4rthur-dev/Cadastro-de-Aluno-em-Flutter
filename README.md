Login Teste

Aplicativo Flutter simples de demonstração contendo telas de Login, Home e Cadastro.

Funcionalidades


Tela inicial (MyHomePage): botão para acessar a tela de login.
Login: valida usuário e senha fixos (4rthur / 13567). Exibe mensagens de erro via SnackBar para campos vazios ou credenciais incorretas, e navega para a Home em caso de sucesso.
Home: tela de boas-vindas com botão de acesso à tela de Cadastro.
Cadastro: formulário com campos de Nome, Email e Curso (seleção via DropdownMenu com lista de cursos pré-definidos). Valida campos vazios e formato de email (verificação do @).


Estrutura de arquivos

lib/
├── main.dart      # Ponto de entrada do app e tela inicial
├── login.dart     # Tela de login
├── home.dart      # Tela home
└── cadastro.dart  # Tela de cadastro

Tecnologias


Flutter
Material Design (ThemeData, ColorScheme.fromSeed)


Como executar


Certifique-se de ter o Flutter SDK instalado.
Clone este repositório.
Instale as dependências:


bash   flutter pub get


Execute o aplicativo:


bash   flutter run

Credenciais de teste

UsuárioSenha4rthur13567
