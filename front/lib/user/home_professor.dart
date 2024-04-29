import 'package:flutter/material.dart';
import 'package:flutter_application_1/atv/criar_atv.dart';
import 'package:flutter_application_1/atv/lista_atv.dart';

import 'package:flutter_application_1/user/lista_usuario.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homeprof',
      routes: {
        '/homeprof': (context) => const HomeProf(),
      },
    );
  }
}

class HomeProf extends StatelessWidget {
  const HomeProf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPT120'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Icon(Icons.person_2), // Adicionando ícone de casa no cabeçalho
      ),
      body: Container(
        padding: const EdgeInsets.all(120.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 254, 255, 255),
              Color.fromARGB(255, 76, 76, 76),
            ],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Lista de Usuários',
                      style: TextStyle(color: Colors.black), // Alterando a cor do texto para preto
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Lista de Atividades',
                      style: TextStyle(color: Colors.black), // Alterando a cor do texto para preto
                    ),
                  ),
                  
                  
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateTaskWidget()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Cadastrar Atividade',
                      style: TextStyle(color: Colors.black), // Alterando a cor do texto para preto
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
