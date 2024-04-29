import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/atv/lista_atv.dart';
import 'package:flutter_application_1/user/create_user.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String errorMessage = ''; // Variável para armazenar a mensagem de erro

  Future<void> fazerLogin() async {
    const String url = 'http://localhost:3000/login';
    final String email = emailController.text;
    final String senha = senhaController.text;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'senha': senha,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];
        // Se o login for bem-sucedido, navegue para a página TaskList
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskList()),
        );
      } else if (response.statusCode == 401) {
        setState(() {
          errorMessage = 'Credenciais inválidas';
        });
      } else {
        setState(() {
          errorMessage = 'Erro desconhecido';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Erro de conexão';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0), // Reduzi o padding para 20.0
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 249, 249, 249),
              Color.fromARGB(255, 76, 76, 76),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: fazerLogin,
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 122, 122, 122),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0), 
              // Exibição da mensagem de erro
              errorMessage.isEmpty
                  ? Container() // Se errorMessage estiver vazio, não exibe nada
                  : Text(
                      errorMessage,
                      style: TextStyle(
                        color: Colors.red, // Cor vermelha para destacar o erro
                        fontSize: 14.0,
                      ),
                    ),
              // Botão para cadastrar usuário
              ElevatedButton(
                onPressed: () {
                  // Navegar para a página CreateUserWidget quando o botão for pressionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateUserWidget()),
                  );
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 122, 122, 122),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
