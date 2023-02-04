import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flowers/model/cart_model.dart';
import 'package:flowers/view/screens/Log_in.dart';
import 'package:flowers/view/screens/home_screen.dart';
import 'package:flowers/view/screens/register.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloomina',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.orangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Log_inPage(),
          '/login': (context) => const Log_inPage(),
          '/register': (context) => const Register(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
