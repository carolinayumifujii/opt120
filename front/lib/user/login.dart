import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/atv/lista_atv.dart'; // Importe a página de lista de atividades aqui
import 'package:http/http.dart' as http;
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> _fetchUsers() async {
    final url = Uri.parse('http://localhost:3000/showUser'); // Substitua pela URL da sua API
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data_atv = json.decode(response.body);

        final List<Map<String, dynamic>> users = data_atv.map((user) {
          return {
            'email': user['email'],
            'senha': user['senha'],
          };
        }).toList();

        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(200.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade200,
              const Color.fromARGB(255, 18, 87, 147),
            ],
          ),
        ),
        child: const Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  void _login(BuildContext context) async {
    final String userEmail = email.text;
    final String password = senha.text;

    try {
     // final List<Map<String, String>>? users = await const LoginPage()._fetchUsers();

      bool credentialsValid = false;
      for (final user in users!) {
        if (user['email'] == userEmail && user['senha'] == password) {
          credentialsValid = true;
          break;
        }
      }

      if (credentialsValid) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TaskList()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Credenciais Inválidas'),
              content: Text('Email ou senha incorretos. Por favor, tente novamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Failed to fetch users: $e');
      // Trate os erros ao buscar os usuários
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: senha,
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _login(context),
              child: const Text('Entrar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 66, 158, 233),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/