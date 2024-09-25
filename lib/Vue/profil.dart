import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int _selectedIndex = 1; // L'index par défaut pour la page profil

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/menujeux'); // Aller vers la page d'accueil
    } else if (index == 1) {
      Navigator.pushNamed(context, '/route2'); // Rester sur la page Profil
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
                        'Profil',
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
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(), // Utilisation de la BottomNavigationBar
    );
  }
}
