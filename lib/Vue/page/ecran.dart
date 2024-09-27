import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bde_app/Vue/page/card.dart';

class Ecran {
  // L'index de la page
  int page = 1;

  final List<CardItem> cards = [
    CardItem(title: 'Card 1', id: 0),
    CardItem(title: 'Card 2', id: 1),
    CardItem(title: 'Card 3', id: 2),
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
        return profileMenu(context);
      case 1:
        return homeMenu(context);
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
                    'Bienvenue, Lucas',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              )),
          SizedBox(height: 15),
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: SizedBox(
                      height: 120, // Augmentation de la hauteur du Dialog
                      child: Row(
                        children: [
                          // Image arrondie à gauche
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  "assets/bowling.jpg",
                                  //height: 50,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width, // La même largeur que l'écran
                                  height: 110, // Ajustement de la hauteur
                                )),
                          ),
                          // Texte à droite
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bowling",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Sortie au bowling d'Arras avec toute l'équipe des 3ème année de l'EPSI",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: cardShortDesc(context, "Bowling",
                "Sortie au bowling d'Arras avec toute l'équipe des 3ème année de l'EPSI",
                img: 'assets/bowling.jpg'),
          ),
          SizedBox(height: 30),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: SizedBox(
                        height: 120, // Augmentation de la hauteur du Dialog
                        child: Row(
                          children: [
                            // Image arrondie à gauche
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/volley.jpg",
                                    //height: 50,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width, // La même largeur que l'écran
                                    height: 110, // Ajustement de la hauteur
                                  )),
                            ),
                            // Texte à droite
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tournoi de volley",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Tournoi de volley avec pour grand gagnant Lucas!!!",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: cardShortDesc(context, "Tournoi de volley",
                  "Tournoi de volley avec pour grand gagnant Lucas!!!",
                  img: "assets/volley.jpg")),
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
                mainTitle("Mon profil", 50, 240),
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
                Text("Lucas Decottignies", style: TextStyle(fontSize: 20)),
                SizedBox(height: 15),
                infoUpdate(context, "E-mail", "lucas@gmail.com"),
                SizedBox(height: 15),
                infoUpdate(context, "Téléphone", "0644762391"),
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
                    passwordUpdate(password1, 'Mot de passe'),
                    SizedBox(height: 10),
                    passwordUpdate(password2, 'Nouveau mot de passe'),
                    SizedBox(height: 10),
                    passwordUpdate(password3, 'Confirmer votre mot de passe'),
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
                mainTitle("Mes évenements", 40, 290),
                SizedBox(height: 20),
                cardShortDesc(context, "Braderie Lille",
                    "Sortie à la braderie de Lille avec toute l'équipe des 3ème année de l'EPSI"),
                SizedBox(height: 15),
                cardShortDesc(context, "Foire d'Arras",
                    "Rendez-vous à la foire d'Arras, au rendez-vous pour rire!!!"),
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
    const FontWeight textWeight = FontWeight.bold;
    final TextEditingController messageController = TextEditingController();
    final ValueNotifier<String?> selectProblemNotifier =
        ValueNotifier<String?>(null);
    List<String> problems = [
      "Problème technique",
      "Remboursement",
      "Questions",
      "Plaintes"
    ];

    // Méthode pour réinitialiser les valeurs
    void resetForm() {
      messageController.clear(); // Réinitialise le champ de texte
      selectProblemNotifier.value =
          null; // Réinitialise la sélection du problème
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.grey.shade200,
              child: Column(children: [
                mainTitle("Support", 50, 240),
                SizedBox(height: 15),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bonjour!",
                        style: TextStyle(fontSize: 20, fontWeight: textWeight)),
                    Text("N'hésitez pas à nous laisser un messages",
                        style: TextStyle(fontSize: 20, fontWeight: textWeight)),
                    Text("concernant vos plaintes,",
                        style: TextStyle(fontSize: 20, fontWeight: textWeight)),
                    Text("demandes de remboursements,",
                        style: TextStyle(fontSize: 20, fontWeight: textWeight)),
                    Text("questions fréquentes ou problèmes",
                        style: TextStyle(fontSize: 20, fontWeight: textWeight)),
                    Text(" techniques.",
                        style: TextStyle(fontSize: 20, fontWeight: textWeight))
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Container(
                      width: 300,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ValueListenableBuilder<String?>(
                            valueListenable: selectProblemNotifier,
                            builder: (context, value, child) {
                              return DropdownButton<String>(
                                value: value,
                                hint: Text(
                                  "Sélectionnez un problème",
                                  style: TextStyle(fontWeight: textWeight),
                                ),
                                onChanged: (String? newValue) {
                                  selectProblemNotifier.value = newValue;
                                },
                                items: problems.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500)),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(children: [
                  Container(
                    width: 300,
                    color: Colors.white,
                    child: TextField(
                      controller:
                          messageController, // Use the controller for the TextField
                      maxLines: 5, // Allow multiple lines
                      decoration: const InputDecoration(
                          hintText: "Saisissez votre message...",
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle:
                              TextStyle(fontSize: 25, fontWeight: textWeight)),
                      style: TextStyle(fontSize: 25, fontWeight: textWeight),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          resetForm();
                        },
                        child: Card(
                          color: Colors.grey.shade300,
                          child: Text('  Valider  ',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 20,
                                  fontWeight: textWeight)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ]),
              ]),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.grey.shade300,
              child: Text(" Conditions Générales d'utilisation  ",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                      fontWeight: textWeight)),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget mainTitle(String type, double textSize, double barsize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type, style: TextStyle(fontSize: textSize)),
            Container(
              height: 5,
              width: barsize,
              color: const Color(0xFFFFDB6F),
            ),
          ],
        )
      ],
    );
  }

  Widget cardShortDesc(BuildContext context, String title, sortDesc,
      {String img = ""}) {
    return Container(
        width: 420,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (img == "")
                Image.network(
                  'https://picsum.photos/${MediaQuery.sizeOf(context).width.toInt().toString()}/200',
                  width: MediaQuery.sizeOf(context).width,
                )
              else
                Image.asset(
                  img,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context)
                      .size
                      .width, // La même largeur que l'écran
                  height: 200,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Rendez-vous à la foire d'Arras, au rendez-vous pour rire!!!",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }

  Widget infoUpdate(BuildContext context, String type, info) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(type, style: TextStyle(fontSize: 30)),
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
                    Text(info,
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
          ])
        ],
      ),
    );
  }

  Widget passwordUpdate(TextEditingController controler, String step) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: step,
      ),
      controller: controler,
    );
  }
}
