import 'package:flutter/material.dart';
import 'package:bde_app/Vue/page/pageview.dart';

class MenuJeux extends StatefulWidget {
  const MenuJeux({super.key, required this.title});

  final String title;

  @override
  State<MenuJeux> createState() => _Dames();
}

class _Dames extends State<MenuJeux> {
  int _selectedIndex = 0; // Variable pour suivre l'index sélectionné
  Ecran ecran = new Ecran();

  // Méthode pour gérer la sélection des éléments de la bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      ecran.setPage(index);
    });
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
      body: ecran.pageDisplay(context),
      bottomNavigationBar:
          buildBottomNavigationBar(), // Utilisation de la BottomNavigationBar
    );
  }
}
