import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/splash_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 132, 0, 0),
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      routes: { SplashScreen.routName: (context) => SplashScreen(),
        TabsScreen.routName: (context) => TabsScreen(),

      },
      initialRoute: SplashScreen.routName,

    );
  }
}
