//
// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
//
// class SplashPage extends StatefulWidget {
//   static const String routeName = "splash-page";
//
//   const SplashPage({super.key});
//
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     Timer(
//       const Duration(seconds: 3),
//           () {
//         Navigator.pushReplacementNamed(context, TabsScreen.routeName);
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage("assists/images/what-kids-eat-in-a-week-world-daily-bread-01mobile.jpg"),
//             fit: BoxFit.fill),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routName = "Splash_Screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TabsScreen()),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(" by __ Ahmed Anwar "),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Image.asset(
            "assists/images/what-kids-eat-in-a-week-world-daily-bread-01mobile.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
