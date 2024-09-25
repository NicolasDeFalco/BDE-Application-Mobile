import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bde_app/Vue/page/card.dart';

class Ecran {
  // L'index de la page
  int page = 0;

  final List<CardItem> cards = [
    CardItem(title: 'Card 1'),
    CardItem(title: 'Card 2'),
    CardItem(title: 'Card 3'),
    // Add more cards as needed
  ];

  /* 
    On a pas besoin d'envoyer l'index de la page
    a l'écran principal. On se contentra uniquement
    de du setter
  */
  void setPage(int newPage) => page = newPage;

  // Renvoie les écrans en fonction de la page
  Widget pageDisplay(BuildContext context) {
    switch (page) {
      case 0:
        return homeMenu(context);
      default:
        return profileMenu(context);
    }
  }

  Widget homeMenu(BuildContext context) {
    return CarouselSlider(
      items: cards.map((card) => Builder(builder: (context) => card)).toList(),
      options: CarouselOptions(
        enableInfiniteScroll: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget profileMenu(BuildContext context) {
    final password1 = TextEditingController();
    final password2 = TextEditingController();
    final password3 = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.grey.shade300,
              child: Column(children: [
                Text("Mon profil", style: TextStyle(fontSize: 50)),
                SizedBox(height: 30),
                Text("E-Mail                                           ",
                    style: TextStyle(fontSize: 30)),
                Text("foo@bar.baz", style: TextStyle(fontSize: 25)),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: Colors.grey.shade800,
                    child: Text('  Modifié  ',
                        style: TextStyle(
                            color: Colors.grey.shade200, fontSize: 20)),
                  ),
                ),
                SizedBox(height: 30),
                Text("Télephone                                           ",
                    style: TextStyle(fontSize: 30)),
                Text("0123456789", style: TextStyle(fontSize: 25)),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: Colors.grey.shade800,
                    child: Text('  Modifié  ',
                        style: TextStyle(
                            color: Colors.grey.shade200, fontSize: 20)),
                  ),
                ),
                SizedBox(height: 30),
                Text("Mot de passe                                        ",
                    style: TextStyle(fontSize: 30)),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Mot de passe',
                  ),
                  controller: password1,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Nouveau mot de passe',
                  ),
                  controller: password2,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Confirmer votre mot de passe',
                  ),
                  controller: password3,
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
          ),
        ],
      ),
    );
  }
}
