import 'package:flutter/material.dart';
import '../../resources/server_controller.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({Key? key}) : super(key: key);


  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  List projects = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future response2 = getProjects();
  }

  Future getProjects() async {
    List response = await ServerControllerAPI().projects();
    setState((){
      projects = response;
    });
    return response;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: (AppBar(
        title: const Text("Luis Carlos Sabogal"),
        backgroundColor: Colors.blue[800]!,
      )
      ),
      body: _selectedIndex==0? RefreshIndicator(
        onRefresh: getProjects,
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index){
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.album),
                    title: Text(projects[index]["name"]),
                    subtitle: Text(projects[index]["website"]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('VER MÁS'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            );
          } ,

        ),
      ):Text("Holi"),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tus Proyectos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800]!,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.blueGrey[100]!,
      drawer: const Drawer(

      ),
    );
  }

}

