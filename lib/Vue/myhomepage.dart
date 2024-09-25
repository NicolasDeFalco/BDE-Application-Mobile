import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
      Padding(
      padding: const EdgeInsets.only(top: 50),
          child:
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/images/checkers.png', fit: BoxFit.cover, width: 200),
              ],
            ),
          )),
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text(
                  'Bienvenue sur',
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Text(
                  'PlayGames !',
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}