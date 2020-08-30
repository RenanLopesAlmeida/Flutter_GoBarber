import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gobarber/app/controllers/auth/auth_controller.dart';
import 'package:flutter_gobarber/app/core/consts/app_colors_const.dart';
import 'package:flutter_gobarber/app/screens/auth/auth_screen.dart';
import 'package:flutter_gobarber/app/screens/home/home_screen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primary,
        accentColor: CustomColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'RobotoSlab',
      ),
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      home: (_authController.isAuthenticated) ? HomeScreen() : AuthScreen(),
    );
  }
}

// return FutureBuilder(
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         final _authController = AuthController();
//         if (snapshot.hasError) {
//           print('error: main.dart firebase...');
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primaryColor: CustomColors.primary,
//               accentColor: CustomColors.primary,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//               fontFamily: 'RobotoSlab',
//             ),
//             routes: {
//               AuthScreen.routeName: (context) => AuthScreen(),
//               HomeScreen.routeName: (context) => HomeScreen(),
//             },
//             home:
//                 (_authController.isAuthenticated) ? HomeScreen() : AuthScreen(),
//           );
//         }

//         return Center(child: CircularProgressIndicator());
//       },
//     );
