import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final TextEditingController usuario = TextEditingController();
  final TextEditingController senha = TextEditingController();


  String resultado = "";

  @override
  void dispose() {
    usuario.dispose();
    senha.dispose();

    super.dispose();
  }

  void validaCampos() {
    String? usu = usuario.text;
    double? password = double.tryParse(senha.text);

    String u = "4rthur";
    double s = 13567;

    if(usu.isEmpty && password == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha os campos usuário e senha"),
          backgroundColor: Colors.red,
        ),
      );
    }

     else if(usu.isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha o campo usuário "),
          backgroundColor: Colors.red,
        ),
      );
    }

   else if(password == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha o campo senha"),
          backgroundColor: Colors.red,
        ),
      );
    }

    //Se os campos preenchidos forem iguais as variaveis (u, s) passa para a próxima tela
    else if(usu == u && password == s) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login bem-sucedido"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );

      //Passa para a próxima tela
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PageHome()
        ),
      );
      //Limpa os campos após passar para a próxima tela
      usuario.clear();
      senha.clear();
    }

    //Se os campos preenchidos forem diferentes das variaveis (u, s) aparece um erro
    else if(usu != u || password != s) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário ou senha incorretos"),
          backgroundColor: Colors.red,
        ),
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),

        backgroundColor: Colors.deepPurpleAccent,

        foregroundColor: Colors.white,
      ),

      body: Center(
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const Icon(
                    Icons.login_outlined,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Faça o seu login abaixo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    controller: usuario,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(maxWidth: 300),
                        labelText: "Usuário",
                        hintText: 'Insira seu nome de usuario',
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2)
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),

                  TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(maxWidth: 300),
                        labelText: "Senha",
                        hintText: "Insira sua senha",
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2)
                        )
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      validaCampos();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurpleAccent,
                        fixedSize: const Size(280, 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16)
                        )
                    ),
                    child: Text("Entrar"),
                  ),

                  Text(
                      resultado
                  ),
                ],
              ),
            )

      ),
    );
  }
}
