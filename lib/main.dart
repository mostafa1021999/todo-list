import 'package:flutter/material.dart';
import 'package:untitled2/shared%20pref.dart';
import 'home.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Save.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness:Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

