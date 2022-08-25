import 'package:flutter/material.dart';
import 'package:teri_frontend/ui/screens/logged_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../resources/server_controller.dart';
import '../../models/user.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage( {Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
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
                offset: const Offset(0,-10),
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
                              decoration: const InputDecoration(labelText: "ID (Persona o empresa)"),
                              keyboardType: TextInputType.phone,
                              onSaved: (value){
                                String? userName = value;
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return "Este campo es obligatorio";
                                }
                              },
                            ),
                            const SizedBox(height: 40),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(labelText: "Contraseña"),
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]!),
                                  padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                                        (Set<MaterialState> states) {
                                      return const EdgeInsets.all(15);
                                    },
                                  ),
                                ),
                                onPressed: (){
                                  _login(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text('Iniciar Sesión'),
                                    if (_loading)
                                      Container(
                                        height: 20,
                                        width: 20,
                                        margin: const EdgeInsets.only(left:20),
                                        child: const CircularProgressIndicator(),
                                      )
                                  ],
                                )
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
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
      ),
      floatingActionButton: const FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: null,
          tooltip: 'Soporte',
          child: Icon(Icons.whatsapp)
      ),
      backgroundColor: Colors.blueGrey[100]!,
    );
  }

  void _login(BuildContext context) async{

    setState(() { _loading = true; });
    Map tokenMap = await ServerControllerAPI().login("julianvargas","Promocion2011..");
    String? token = tokenMap["key"];
    if ( token != null ) {
      setState(() { _loading = false; });
      final route = MaterialPageRoute(builder: (BuildContext context){
        return const LoggedPage(title: "Hola Julixx");
      });
      Navigator.of(context).push(route);
    }else {
      setState(() { _loading = false; });
    }
  }
}
