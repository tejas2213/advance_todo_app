import 'package:flutter/material.dart';
import 'TodoScreen.dart';
import 'db_helper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Ensure database is initialized before UI starts
  await DbHelper.instance.database;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
