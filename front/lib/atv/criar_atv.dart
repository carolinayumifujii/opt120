import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateTaskWidget extends StatefulWidget {
  @override
  _CreateTaskWidgetState createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  String titulo = '';
  String descricao = '';
  String nota = '';
  String data_atv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPT120'),
        backgroundColor: const Color.fromARGB(255, 36, 160, 237),
      ),
      body: Container(
        padding: const EdgeInsets.all(120.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 138, 197, 245),
              Color.fromARGB(255, 14, 68, 115),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Text(
              'Cadastro De Atividade\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
              ),
            ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Titulo',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    titulo = value;
                  });
                },
              ),
              SizedBox(height: 10), // Add some spacing
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                //contentPadding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 16.0), // Ajuste o preenchimento conforme necessário
 
                ),
                onChanged: (value) {
                  setState(() {
                    descricao = value;
                  });
                },
              ),
              SizedBox(height: 10), // Add some spacing
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nota',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    nota = value;
                  });
                },
              ),
              SizedBox(height: 10), // Add some spacing
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Data',
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    data_atv = value;
                  });
                },
              ),
              const SizedBox(height: 10), // Add some spacing
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 130, 197, 252),
                   shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                ),
                onPressed: () async {

                  final response = await http.post(
                    Uri.parse('http://localhost:3000/newActivity'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      'titulo': titulo,
                      'descricao': descricao,
                      'nota': nota,
                      'data_atv': data_atv,
                    }),
                  );

                  if (response.statusCode == 200) {
                    print('User created successfully');
                  } else {
                    throw Exception('Failed to create user');
                  }
                },
                child: const Text('Cadastrar'),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
