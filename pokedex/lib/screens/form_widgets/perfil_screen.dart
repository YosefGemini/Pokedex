import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/screens/welcome/welcome_screen.dart';
import 'package:pokedex/utils/alerts.dart';
import 'package:pokedex/widgets/Buttons/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nombre: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            CostumButton(
                callback: () {
                  CostumAlert.showConfirmationAlert(
                      context,
                      ArtSweetAlertType.warning,
                      "Cerrar sesion",
                      "esta seguro de cerrar Sesion",
                      "Si",
                      "No", () {
                    print("Se ha confirmado la accion");

                    final route =
                        MaterialPageRoute(builder: (context) => Welcome());
                    Navigator.push(context, route);
                  }, () {
                    print("Se ha cancelado la accion");
                  });
                },
                text: "Cerrar Sesion")
          ],
        ),
      ),
    );
  }
}
