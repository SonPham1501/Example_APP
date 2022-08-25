import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/first_screen.dart';

import 'app_config/main_development.dart';
import 'injection.dart';

// void main() {
//   configureDependencies();
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     //color set to transperent or set your own color
//     statusBarIconBrightness: Brightness.dark,
//     //set brightness for icons, like dark background light icons
//   ));
//   runApp(const MyApp());
// }
void main() => Development();
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Test',
//       theme: ThemeData(
//           appBarTheme: const AppBarTheme(
//             color: Colors.white,
//             elevation: 0,
//           ),
//           scaffoldBackgroundColor: Colors.blue.shade50),
//       home: const HomeScreen(),
//     );
//   }
// }
