import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'TERI ERP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,
        primaryColor: Colors.blue[800]!,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue[400]!),
      ),
      home: const MyHomePage(title: 'TERI ERP'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
          width: double.infinity,
          decoration: BoxDecoration(
          gradient: LinearGradient( colors: [  Colors.blue[800]!,  Colors.blue[900]!]
              ),
            ),
            height:350,
            child: Image.asset(
                "assets/images/Logo_sense_blanco.png",
            ),
          ),
          Transform.translate(
            offset: Offset(0,-10),
            child: SingleChildScrollView(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: const EdgeInsets.only(left:20, right: 20, top: 260),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:35, vertical:20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Usuario"),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Contraseña"),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue[800]!),
                            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                                  (Set<MaterialState> states) {
                                return EdgeInsets.all(15);
                              },
                            ),
                          ),
                        onPressed: (){
                          _login(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Iniciar Sesión'),
                            if (_loading)
                              Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.only(left:20),
                                child: CircularProgressIndicator(),
                              )
                          ],
                        )
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Este es un aplicativo para clientes",
                            style: TextStyle(
                              color: Colors.blue,
                            ),)
                        ],
                      )
                    ]
                  ),
                ),
              ),
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: null,
        tooltip: 'Soporte',
        child: Icon(Icons.whatsapp)
      ),
      backgroundColor: Colors.blueGrey[100]!,
    );
  }

  void _login(BuildContext context) {
    setState(() {
      _loading = true;
    });
  }
}
