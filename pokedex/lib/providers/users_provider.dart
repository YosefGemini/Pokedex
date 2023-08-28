import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/dtos/user_model.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UsersProvider extends ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  static Future<Status> loginUser(String username, String password) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password)
        .get();

    if (snapshot.docs.length == 1) {
      print('usuario autentificado');
      return Status.Authenticated;
      // Usuario autenticado correctamente
      // Puedes realizar la navegación a la siguiente pantalla
    } else {
      // Usuario no encontrado o credenciales incorrectas
      print('usuario no encontrado');
      return Status.Unauthenticated;
      // Puedes mostrar un mensaje de error al usuario
    }
  }

  static Future<void> registerUser(
      String name, String username, String email, String password) async {
    final uuid = Uuid();
    String uniqueId = uuid.v4();
    await FirebaseFirestore.instance
        .collection('users')
        .add({
          'id': uniqueId,
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        })
        .then((value) => print("Usuario registrado correctamente"))
        .onError((error, stackTrace) => print(error));
  }
}
