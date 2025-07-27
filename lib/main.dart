import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/IniciarSesion/inicioSesion.dart';
import 'package:flutter_application_1/Pages/calendario/calendario.dart';
import 'package:flutter_application_1/Pages/completar/porCompletar.dart';
import 'package:flutter_application_1/Pages/home/home.dart';
import 'package:flutter_application_1/Pages/perfil/perfil.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const InicioSesion(),
        '/home': (context) => const DashboardView(), // Home principal
        '/tareas': (context) => const TaskListView(),
        '/calendario': (context) => const CalendarView(),
        '/perfil': (context) => const ProfileView(),
      },
    );
  }
}
