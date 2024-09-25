import 'package:flutter/material.dart';

class MenuJeux extends StatefulWidget {
  const MenuJeux({super.key, required this.title});

  final String title;

  @override
  State<MenuJeux> createState() => _Dames();
}

class _Dames extends State<MenuJeux> {
  int _selectedIndex = 0; // Variable pour suivre l'index sélectionné

  // Méthode pour gérer la sélection des éléments de la bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/menujeux');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/route2'); // Aller vers la page Profil
    }
  }

  // Méthode réutilisable pour la BottomNavigationBar
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      currentIndex: _selectedIndex, // L'index actuellement sélectionné
      selectedItemColor: Colors.brown, // Couleur de l'élément sélectionné
      onTap: _onItemTapped, // Appelée lors de la sélection d'un élément
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Ajustez le rayon ici
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
      ),
      bottomNavigationBar: buildBottomNavigationBar(), // Utilisation de la BottomNavigationBar
    );
  }
}
