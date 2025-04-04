import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Cria um widget de contêiner
        padding: const EdgeInsets.only(
            // Adiciona margens ao widget
            top: 60, // Margem superior
            left: 40, // Margem esquerda
            right: 40 // Margem direita
            ),
        color: Colors.white, // Cor de fundo do widget

        // Cria um widget de lista vertical
        child: ListView(
          children: <Widget>[
            // Cria uma lista de widgets
            SizedBox(
              // Cria um widget de tamanho fixo
              width: 250, // Largura do widget
              height: 250, // Altura do widget
              child: Image.asset("assets/logo.png"), // Carrega uma imagem
            ),

            // Cria um widget de espaço vertical para o título
            const SizedBox(
              height: 25, // Espaço entre a imagem e o texto
              child: Text(
                // Cria um widget de texto
                "E-mail", // Texto do widget
                style: TextStyle(
                  // Estilo do texto
                  fontSize: 15, // Tamanho do texto
                  fontWeight: FontWeight.w500, // Peso do texto
                ),
              ),
            ),

            // Cria um widget de campo de texto
            TextFormField(
              keyboardType: TextInputType
                  .emailAddress, // Tipo de teclado para o campo de texto
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelStyle: const TextStyle(
                  color: Colors.black38, // Cor do rótulo
                  fontWeight: FontWeight.w400, // Peso do rótulo
                  fontSize: 20, // Tamanho do rótulo
                ),
              ),
              style: const TextStyle(
                  fontSize: 20), // Estilo do texto do campo de texto
            ),

            // Cria um widget de espaço vertical
            const SizedBox(
              height: 10, // Altura do widget
            ),

            const SizedBox(
              height: 25, // Espaço entre a imagem e o texto
              child: Text(
                // Cria um widget de texto
                "Password", // Texto do widget
                style: TextStyle(
                  // Estilo do texto
                  fontSize: 15, // Tamanho do texto
                  fontWeight: FontWeight.w500, // Peso do texto
                ),
              ),
            ),

            // Cria um widget de campo de texto
            TextFormField(
              keyboardType:
                  TextInputType.text, // Tipo de teclado para o campo de texto
              obscureText: true, // O campo de texto é oculto
              decoration: InputDecoration(
                // Cria um widget de input de texto
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelStyle: const TextStyle(
                  // Estilo do rótulo
                  color: Colors.black38, // Cor do rótulo
                  fontWeight: FontWeight.w400, // Peso do rótulo
                  fontSize: 20, // Tamanho do rótulo
                ),
              ),
              style: const TextStyle(
                  fontSize: 20), // Estilo do texto do campo de texto
            ),

            SizedBox(
              // Cria um widget de contêiner
              height: 40, // Cor de fundo do widget
              child: TextButton(
                child: const Text(
                  "Esqueci a senha", // Texto do widget
                  textAlign: TextAlign.right, // Alinhamento do texto
                  style: TextStyle(color: Colors.black), // Cor do texto
                ),
                onPressed: () {}, // Ação do botão
              ), // Altura do widget
            ),

            // Cria um widget de espaço vertical
            const SizedBox(
              height: 30, // Altura do widget
            ),

            // Cria um widget de botão
            Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF2F667F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
