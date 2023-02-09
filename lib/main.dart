import 'package:flutter/material.dart';
import 'package:realtime_chat_proyect/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: "chat",
      routes: appRoutes,
    );
  }
}
