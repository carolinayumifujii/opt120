import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CreateUserWidget extends StatefulWidget {
  String? get userId => null;

  @override
  _CreateUserWidgetState createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  String nome = '';
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPT120'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        padding: const EdgeInsets.all(120.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 76, 76, 76),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Text(
              'Cadastro Novo Usuário\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              ),
            ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
              SizedBox(height: 20), // Add some spacing
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20), // Add some spacing
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              const SizedBox(height: 20), // Add some spacing
              ElevatedButton(
                onPressed: () async {
                  final response = await http.post(
                    Uri.parse('http://localhost:3000/newUser'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      'nome': nome,
                      'email': email,
                      'senha': senha,
                    }),
                  );

                  if (response.statusCode == 200) {
                    // If the server returns a 200 OK response,
                    // then parse the JSON.
                    print('User created successfully');
                  } else {
                    // If the server did not return a 200 OK response,
                    // then throw an exception.
                    throw Exception('Failed to create user');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 174, 174, 174),
                   shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                ),
                child: const Text(
                  'Cadastrar',
                  
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
