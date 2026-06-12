import 'package:flutter/material.dart';
import 'cadastro.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),

        backgroundColor: Colors.deepPurpleAccent,

        foregroundColor: Colors.white,
      ),

      body: Padding(
          padding: const EdgeInsets.all(24),

             child: Center(
               child: Column(
                 mainAxisAlignment: .center,
                 children: [
                   const Icon(
                     Icons.home,
                     size: 60,
                   ),

                   const SizedBox(
                     height: 20,
                   ),

                   Text(
                     "Seja Bem-Vindo",
                     style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                     ),
                   ),

                   const SizedBox(
                     height: 20,
                   ),
                   ElevatedButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const PageCadastro()
                           ),
                         );
                       },
                       style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.white,
                           foregroundColor: Colors.deepPurpleAccent,
                           fixedSize: const Size(280, 30),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadiusGeometry.circular(16)
                           )
                       ),
                       child: Text("Cadastro")
                   )
                 ],
               ),
             )

      ),
    );
  }
}
