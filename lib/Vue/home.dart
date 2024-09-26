import 'package:flutter/material.dart';
import 'package:bde_app/Vue/page/ecran.dart';

class MenuJeux extends StatefulWidget {
  const MenuJeux({super.key, required this.title});

  final String title;

  @override
  State<MenuJeux> createState() => _Dames();
}

class _Dames extends State<MenuJeux> {
  int _selectedIndex = 0; // Variable pour suivre l'index sélectionné

  /*
    Cette variable va contenire toute les pages
    que l'on pourait voir a l'acueil de l'appli.

    Cela nous évite de refaire un nouvelle écran a 
    chaque fois
  */
  Ecran ecran = new Ecran();

  // Méthode pour gérer la sélection des éléments de la bottom navigation bar
  void _onItemTapped(int index) {
    /*
      Ceci nous permetera de modifier l'affichage
    */
    setState(() {
      ecran.setPage(index);
    });
  }

  // Méthode réutilisable pour la BottomNavigationBar
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Mail',
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/epsi.png",
              height: 50,
            ),
            Image.asset(
              "assets/wis.png",
              height: 50,
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ecran.pageDisplay(context), // Tout le écran viennent d'ici
      bottomNavigationBar:
          buildBottomNavigationBar(), // Utilisation de la BottomNavigationBar
    );
  }
}
