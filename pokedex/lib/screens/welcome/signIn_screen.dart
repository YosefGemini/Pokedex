import 'package:flutter/material.dart';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:pokedex/providers/users_provider.dart';
import 'package:pokedex/screens/form_widgets/home_screen.dart';
import 'package:pokedex/screens/welcome/welcome_screen.dart';
import 'package:pokedex/utils/alerts.dart';
import 'package:pokedex/utils/validators.dart';
import 'package:pokedex/widgets/Buttons/button.dart';
import 'package:pokedex/widgets/inputs/input.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginForm = GlobalKey<FormState>();
  //Funcion de Limpiado de campos
  void _clearFields() {
    setState(() {
      _usernameController.text.isNotEmpty
          ? _usernameController.text = ''
          : _usernameController.text;
      _passwordController.text.isNotEmpty
          ? _passwordController.text = ''
          : _passwordController.text;
    });
  }

  //Funcion de registro
  Future _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    //Ruta de la pagina home
    final route = MaterialPageRoute(
        builder: (context) => MainWidget(
              sesionState: true,
            ));
    print('Nombre: Username: $username  Contraseña: $password');
    //Alerta de registro exitoso

    if (_loginForm.currentState!.validate()) {
      print("Formulario valido \n");

      await UsersProvider.loginUser(username, password).then((value) => {
            if (value == Status.Authenticated)
              {
                CostumAlert.showSimpleAlert(context, ArtSweetAlertType.success,
                        "Bienvenido", "Inicio de sesion correcta", "OK")
                    .then(
                      (value) => {Navigator.push(context, route)},
                    )
                    .then((value) => {_clearFields()})
              }
            else if (value == Status.Unauthenticated)
              {
                CostumAlert.showSimpleAlert(context, ArtSweetAlertType.danger,
                        "Error", "Credenciales Incorrectas", "OK")
                    .then((value) => (value) => {_clearFields()})
              }
          });

      //Alerta de registro exitoso

      // Realizar acción de envío
    } else {
      print('Formulario invalido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Iniciar Sesión"),
        //   backgroundColor: Color(0xFFF97F6F),
        // ),
        body: Container(
      alignment: Alignment.center,
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
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _loginForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomInput(
                      controller: _usernameController,
                      label: "Usuario",
                      validator: Validators.validateNotNull),
                  SizedBox(height: 16.0),
                  CustomInput(
                      controller: _passwordController,
                      label: "Contraseña",
                      isPassword: true,
                      validator: Validators.validateNotNull),
                  SizedBox(height: 16.0),
                  CostumButton(callback: _login, text: "Iniciar Sesión"),
                  SizedBox(height: 16.0),
                  CostumButton(
                      callback: () {
                        final route =
                            MaterialPageRoute(builder: (context) => Welcome());
                        Navigator.push(context, route);
                      },
                      text: "Regresar")
                ],
              ),
            ),
          )),
    ));
  }
}
