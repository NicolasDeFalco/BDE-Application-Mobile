import 'package:flutter/material.dart';

class Ecran {
  int page = 0;

  void setPage(int newPage) => page = newPage;

  Widget pageDisplay(BuildContext context) {
    switch (page) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Exemple Site',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ])),
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/route2');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Ajustez le rayon ici
                    ),
                  ),
                ),
                child: const Text(
                  "Bouton",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        );

      default:
        return const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Profil',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ])),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
              ),
            ],
          ),
        );
    }
  }
}
