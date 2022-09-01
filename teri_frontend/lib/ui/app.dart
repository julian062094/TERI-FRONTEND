import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:teri_frontend/bloc/bloc_user.dart';
import 'package:teri_frontend/ui/screens/my_home_page.dart';

import 'screens/logged_page.dart';

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
          brightness: Brightness.light,
          primaryColor: Colors.blue[800]!,
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue[400]!),
        ),
        //home: const MyHomePage()
        home: const LoggedPage()
      ));
  }
}
