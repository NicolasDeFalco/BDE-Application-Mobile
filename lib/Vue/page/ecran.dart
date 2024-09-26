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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
              height: 40,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenue, Sarkozy',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              )),
          Container(
            color: Color(0xFFFFDB6F),
            child: CarouselSlider(
              items: cards
                  .map((card) => Builder(builder: (context) => card))
                  .toList(),
              options: CarouselOptions(
                enableInfiniteScroll: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
              width: 420,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/picsum/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Giga hampter for sale",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "We are selling hampter, they are not stinky, trust me bro",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 30),
          Container(
              width: 420,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/picsum/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Jigglypuff",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hungry box like to play jigglypuff in smash bros, idk why",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ))
        ],
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
              color: Colors.yellow.shade400,
              child: Column(children: [
                Text("Mon profil", style: TextStyle(fontSize: 50)),
                SizedBox(height: 30),
                Card(
                  color: Colors.blue.shade400,
                  child: Column(children: [
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
                  ]),
                ),
                SizedBox(height: 30),
                Card(
                  color: Colors.blue.shade400,
                  child: Column(children: [
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
                  ]),
                ),
                SizedBox(height: 30),
                Card(
                  color: Colors.blue.shade400,
                  child: Column(
                    children: [
                      Text(
                          "Mot de passe                                        ",
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
                    ],
                  ),
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
