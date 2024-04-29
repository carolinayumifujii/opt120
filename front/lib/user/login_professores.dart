import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/home_professor.dart';
import 'package:http/http.dart' as http;

class LoginPageProf extends StatefulWidget {
  @override
  _LoginPageProfState createState() => _LoginPageProfState();
}

class _LoginPageProfState extends State<LoginPageProf> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String errorMessage = ''; // Variável para armazenar a mensagem de erro

  Future<void> fazerLogin() async {
    const String url = 'http://localhost:3000/login';
    final String email = emailController.text;
    final String senha = senhaController.text;

    // Verifica se o email contém o domínio correto
    if (!email.endsWith('@professores.utfpr.edu.br')) {
      setState(() {
        errorMessage = 'Apenas professores da UTFPR podem fazer login.';
      });
      return;
    }

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
        // Se o login for bem-sucedido, navegue para a página HomeProf
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeProf()),
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
              // Exibir mensagem de erro, se houver
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
