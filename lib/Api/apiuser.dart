import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getUser(String email) async {
  final response = await http.get(
    Uri.parse('https://s3-4664.nuage-peda.fr/BDEAPI/public/api/users/$email'),
    headers: {'Content-Type': 'application/ld+json',},
  );

  //200 -> bon
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    var user = responseData['hydra:member'];
    //si user n'est pas vide, prendre ses infos
    if (user.isNotEmpty) {
      var infosUser = user[0];
      return {
        'id':infosUser['id'],
        'email': infosUser['email'],
      };
    } else {
      // User inexstant -> user associé à aucun e-email
      return {
        'email': null, // Email par défaut si jamais
      };
    }
  } else {
    // Gérer l'échec de la tentative de récupération des infos
    print(
        "Échec de la récupération des infos. Statut code: ${response.statusCode}");
    print("Réponse du serveur: ${response.body}");

    // Retourner une valeur par défaut
    return {
      'email': null,
    };
  }
}

Future<List<Map<String, dynamic>>> getListUsers() async {
  final response = await http.get(
    Uri.parse('http://s3-4664.nuage-peda.fr/BDEAPI/public/api/users'),
    headers: {'Content-Type': 'application/ld+json',},
  );

  //200 = bon
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    var users = responseData['hydra:member'];
    if (users.isNotEmpty) {
      // Map chaque joueur avec ses statistiques
      var tri = users.map<Map<String, dynamic>>((infosUser) {
        return {
          'id':infosUser['id'],
          'email': infosUser['email'],
        };
      }).toList();

      return tri;
    } else {
      // Aucun user trouvé.
      return [];
    }
  } else {
    // Gérer l'échec de la tetative de récupération des statistiques
    print(
        "Échec de la récupération des statistiques. Statut code: ${response.statusCode}");
    print("Réponse du serveur: ${response.body}");

    // Retourner une liste vide en cas d'échec
    return [];
  }
}