import 'package:flutter/material.dart';
import 'Vue/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayGames',
      //moyen d'effacer la banderole qui se trouvais en haut à droite
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MenuJeux(title: 'Home'),
      routes: <String, WidgetBuilder>{
        '/menujeux': (BuildContext context) => MenuJeux(title: ''),
        '/route2': (BuildContext context) => MenuJeux(title: ''),
      },
    );
  }
}
