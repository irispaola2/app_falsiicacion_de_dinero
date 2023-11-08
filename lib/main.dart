import 'package:app_falsiicacion_de_dinero/screens/screens.dart';
import 'package:app_falsiicacion_de_dinero/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FalsificacionService())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'falsificacion': (_) => FalsificacionScreen(),
        },
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme:
                AppBarTheme(elevation: 0, color: Color.fromARGB(255, 0, 0, 0)),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 255, 13, 13),
                elevation: 0)));
  }
}
