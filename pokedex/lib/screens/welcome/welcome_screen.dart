import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:pokedex/screens/welcome/signIn_screen.dart';
import 'package:pokedex/screens/welcome/signup_screen.dart';
import 'package:pokedex/widgets/Buttons/button.dart';

class Welcome extends StatefulWidget {
  static const routeName = '/welcome';
  //Welcome({Key key}) : super(key: key);s

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo_login.jpg'),
          fit: BoxFit.cover,
        ),
        //Caracteristica de boxdecoration de fondo con gradiente par
        // gradient: LinearGradient(

        //   colors: <Color>[
        //    const  Color(0xFFF97F6F),
        //     const  Color(0xFFC4EBFF),
        //   ],
        //   begin: Alignment.topCenter,
        // )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Icono de la aplicacion
          //IconContainer(imageurl: 'assets/Logo_welcome_2.png'),
          Text(
            "Flutter Pokedex",
            style: TextStyle(
                fontSize: 40.0,
                color: Color(0xFF312E49),
                fontWeight: FontWeight.bold),
          ),
          // Texto de bienvenida
          const Text(
            'Bienvenido',
            style: TextStyle(
                fontSize: 30.0,
                color: Color(0xFF312E49),
                fontWeight: FontWeight.normal),
          ),
          Divider(
            height: 20.0,
          ),
          // Boton para redirigir al Login
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: CostumButton(
                  callback: () {
                    final route =
                        MaterialPageRoute(builder: (context) => SignIn());
                    Navigator.push(context, route);
                  },
                  text: "Iniciar Sesión")),

          //Boton para redirigir al registro
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: CostumButton(
                  callback: () {
                    final route =
                        MaterialPageRoute(builder: (context) => SignUp());
                    Navigator.push(context, route);
                  },
                  text: "Registrarse"))
        ],
      ),
    ));
  }
}
