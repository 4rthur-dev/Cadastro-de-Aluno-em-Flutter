import 'package:flutter/material.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({super.key});

  @override
  State<PageCadastro> createState() => _PageCadastro();
}

class _PageCadastro extends State<PageCadastro> {
  final nome = TextEditingController();
  final email = TextEditingController();
  final curso = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String str = "";

  //Lista do cursos
  List<String> cursos = [
    "Tecnologia da Informação",
    "Gestão e Negócios",
    "Gastronomia",
    "Idiomas",
    "Moda",
    "Saúde e Bem-estar",
    "Comunicação e Design",
    "Hospitalidade e Turismo"
  ];


  @override
  void dispose() {
    nome.dispose();
    email.dispose();
    curso.dispose();

    super.dispose();
  }

  //Função principal
  void validarCampos() {
    String? name = nome.text;
    String? mail = email.text;
    String? course = curso.text;

    setState(() {
      str = "";
    });

    //Validar se os campos estão vazios
    if(name.isEmpty || mail.isEmpty || course.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha todos os campos"),
          backgroundColor: Colors.red,
        ),
      );
    }
    //Validar se nom campo Email tem o '@'
     else if(mail.contains("@")) {
       if (formKey.currentState!.validate()) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text("Cadastro realizado com sucesso"),
             backgroundColor: Colors.green,
           ),
         );

         //Limpa os campos após o cadastro for concluido
         nome.clear();
         email.clear();
         curso.clear();
         setState(() {});
       }
    }
    else {
      setState(() {
        str = "Informe um email válido (@)";
      });
    }
  }


  // FRONT-END
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),

        backgroundColor: Colors.deepPurpleAccent,

        foregroundColor: Colors.white,
      ),

      body: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const Icon(
                    Icons.account_circle,
                    size: 80
                ),

                //Espaçamento do Icone com o textp
                const SizedBox(
                  height: 10,
                ),

                Text(
                  "Cadastre as suas informações abaixo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                //Espaçamento do texto com o input
                const SizedBox(
                  height: 20,
                ),

                //Campo Nome
                TextFormField(
                  controller: nome,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: 300),
                      labelText: "Nome",
                      hintText: "Insira seu nome",
                      prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2)
                      )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      setState(() {
                        str = "Informe seu nome";
                      });
                    }
                    return null;

                  },
                ),

                //Espaçamento do campo Nome com o campo Email
                const SizedBox(
                  height: 12,
                ),

                //Campo Email
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: 300),
                    labelText: "Email",
                    hintText: "Informe o seu email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2)
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      setState(() {
                        str = "Preencha o campo do email";
                      });
                    }
                    return null;
                  },

                ),
                //Espaçamento do campo Email com o campo Curso
                const SizedBox(
                  height: 12,
                ),

                //Campo Curso
                DropdownMenu<String>(
                  controller: curso, // Associa o mesmo controller para pegar o texto
                  enableFilter: true, // Ativa a digitação para filtrar
                  requestFocusOnTap: true, // Abre o teclado ao tocar no campo
                  leadingIcon: const Icon(Icons.school, color: Colors.black),
                  label: const Text("Curso"),
                  hintText: "Cursando em",

                  // Replica a identidade visual dos seus outros inputs
                  inputDecorationTheme: InputDecorationTheme(
                    constraints: BoxConstraints(maxWidth: 300),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
                    ),
                  ),

                  // Mapeia a sua lista de cursos existente
                  dropdownMenuEntries: cursos.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),

                //Espaçamento do campo Curso com o botao
                const SizedBox(
                  height: 32,
                ),

                //Botao slavar cadastro
                ElevatedButton(
                    onPressed: () {
                      validarCampos();

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurpleAccent,
                        fixedSize: const Size(280, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12)
                        )
                    ),
                    child: Text("Salvar Cadastro")
                ),
                const SizedBox(
                  height: 14,
                ),

                Text(
                  str,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),
                )
              ],
            ),
          )

      ),
    );
  }
}