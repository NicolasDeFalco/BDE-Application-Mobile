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
      case 1:
        return profileMenu(context);
      default:
        return mailMenu(context);
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
                      'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
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
                      'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
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
              color: Colors.grey.shade200,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mon profil", style: TextStyle(fontSize: 50)),
                        Container(
                          height: 5,
                          width: 240,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: ClipOval(
                      child: Container(
                    color: Colors.white,
                    child: Icon(
                      Icons.person_outline,
                      size: 50.0,
                    ),
                  )),
                ),
                Text("Nicolas Sarkozy", style: TextStyle(fontSize: 20)),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("E-mail", style: TextStyle(fontSize: 30)),
                        Container(
                          height: 3,
                          width: 70,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(children: [
                  Container(
                      width: 300,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("foo@bar.baz",
                              style: TextStyle(
                                  fontSize: 25, backgroundColor: Colors.white)),
                        ],
                      )),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.grey.shade300,
                          child: Text('  Modifier  ',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Téléphone", style: TextStyle(fontSize: 30)),
                        Container(
                          height: 3,
                          width: 100,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(children: [
                  Container(
                      width: 300,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("0123456789",
                              style: TextStyle(
                                  fontSize: 25, backgroundColor: Colors.white)),
                        ],
                      )),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.grey.shade300,
                          child: Text('  Modifier  ',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mot de passe", style: TextStyle(fontSize: 30)),
                        Container(
                          height: 3,
                          width: 140,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  children: [
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.grey.shade300,
                            child: Text('  Modifier  ',
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 7,
            width: MediaQuery.sizeOf(context).width - 20,
            color: Color(0xFFFFDB6F),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              color: Colors.grey.shade200,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mes évenements", style: TextStyle(fontSize: 40)),
                        Container(
                          height: 5,
                          width: 290,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
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
                            'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
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
                SizedBox(height: 15),
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
                            'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
                            width: MediaQuery.sizeOf(context).width,
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Dog appreciation day",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Let's have a walk with our little friend. It'll be so adorable",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey.shade300,
              child: Text('  Se déconnecter  ',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 20)),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget mailMenu(BuildContext context) {
    final password1 = TextEditingController();
    final password2 = TextEditingController();
    final password3 = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.grey.shade200,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mon profil", style: TextStyle(fontSize: 50)),
                        Container(
                          height: 5,
                          width: 240,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                SizedBox.fromSize(
                  size: const Size(80, 80),
                  child: ClipOval(
                      child: Container(
                    color: Colors.white,
                    child: Icon(
                      Icons.person_outline,
                      size: 50.0,
                    ),
                  )),
                ),
                Text("Nicolas Sarkozy", style: TextStyle(fontSize: 20)),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("E-mail", style: TextStyle(fontSize: 30)),
                        Container(
                          height: 3,
                          width: 70,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(children: [
                  Container(
                      width: 300,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("foo@bar.baz",
                              style: TextStyle(
                                  fontSize: 25, backgroundColor: Colors.white)),
                        ],
                      )),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.grey.shade300,
                          child: Text('  Modifier  ',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Téléphone", style: TextStyle(fontSize: 30)),
                        Container(
                          height: 3,
                          width: 100,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(children: [
                  Container(
                      width: 300,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("0123456789",
                              style: TextStyle(
                                  fontSize: 25, backgroundColor: Colors.white)),
                        ],
                      )),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.grey.shade300,
                          child: Text('  Modifier  ',
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mot de passe", style: TextStyle(fontSize: 30)),
                        Container(
                          height: 3,
                          width: 140,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  children: [
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.grey.shade300,
                            child: Text('  Modifier  ',
                                style: TextStyle(
                                    color: Colors.grey.shade800, fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 7,
            width: MediaQuery.sizeOf(context).width - 20,
            color: Color(0xFFFFDB6F),
          ),
          SizedBox(height: 15),
          Container(
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              color: Colors.grey.shade200,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mes évenements", style: TextStyle(fontSize: 40)),
                        Container(
                          height: 5,
                          width: 290,
                          color: Color(0xFFFFDB6F),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
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
                            'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
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
                SizedBox(height: 15),
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
                            'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
                            width: MediaQuery.sizeOf(context).width,
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Dog appreciation day",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Let's have a walk with our little friend. It'll be so adorable",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey.shade300,
              child: Text('  Se déconnecter  ',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 20)),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
