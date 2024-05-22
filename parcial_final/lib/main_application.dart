import 'package:flutter/material.dart';
import 'package:parcial_final/views/view_login.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewLogin(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 235,219,178),
            onPrimary: Color.fromARGB(255, 184,187,38),
            secondary: Color.fromARGB(255, 215,153,33),
            onSecondary: Color.fromARGB(255, 250,189,47),
            error: Color.fromARGB(255, 204,36,29),
            onError: Color.fromARGB(255, 251, 73, 52),
            background: Color.fromARGB(255, 40,40,40),
            onBackground: Color.fromARGB(255, 251,241,199),
            surface: Color.fromARGB(255, 102,92,84),
            onSurface: Color.fromARGB(255, 168,153,132)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 251,241,199)
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 251,241,199)
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 251,241,199)
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 235,219,178)
          )
        ),
      ),
    );
  }
}
