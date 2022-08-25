import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:teri_frontend/bloc/bloc_user.dart';
import 'package:teri_frontend/ui/screens/logged_page.dart';
import 'package:teri_frontend/ui/screens/my_home_page.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
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
        home: const MyHomePage(),
      ));
  }
}
