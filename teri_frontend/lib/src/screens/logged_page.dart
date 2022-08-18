import 'package:flutter/material.dart';

class LoggedPage extends StatelessWidget {
  const LoggedPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text(title),
        backgroundColor: Colors.blue[800]!,
      )
      ),
      body: Center(
        child:  Text("Información del usuario"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Proyectos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        //currentIndex: null,
        selectedItemColor: Colors.blue[800]!,
        onTap: null,
      ),
      backgroundColor: Colors.blueGrey[100]!,
      drawer: Drawer(

      ),
    );
  }
}

