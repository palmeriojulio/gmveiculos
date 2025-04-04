import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Nova importação

void main() => runApp(const VehicleCareApp());

class VehicleCareApp extends StatelessWidget {
  const VehicleCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GM Veículos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(), // Tela inicial agora é Login
    );
  }
}
