import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/providers/users_provider.dart';
import 'package:pokedex/screens/welcome/welcome_screen.dart';
import 'package:pokedex/utils/validators.dart';
import 'package:pokedex/utils/alerts.dart';
import 'package:pokedex/widgets/Buttons/button.dart';
import 'package:pokedex/widgets/inputs/input.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _signUpForm = GlobalKey<FormState>();
  //Funcion de Limpiado de campos
  void _clearFields() {
    setState(() {
      _emailController.text.isNotEmpty
          ? _emailController.text = ''
          : _emailController.text;
      _passwordController.text.isNotEmpty
          ? _passwordController.text = ''
          : _passwordController.text;
      _nameController.text.isNotEmpty
          ? _nameController.text = ''
          : _nameController.text;
      _usernameController.text.isNotEmpty
          ? _usernameController.text = ''
          : _usernameController.text;
    });
  }

  //Funcion de registro
  void _signUpFunc() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    String username = _usernameController.text;
    print("estado de validacion: ");
    print(_signUpForm.currentState!.validate());

    if (_signUpForm.currentState!.validate()) {
      print("Formulario valido \n");
      print(
          'Nombre: $name, Username: $username  Correo: $email, Contraseña: $password');
      UsersProvider.registerUser(name, username, email, password)
          .then((value) => {
                CostumAlert.showSimpleAlert(
                        context,
                        ArtSweetAlertType.success,
                        "Registro exitoso",
                        "Se ha registrado correctamente",
                        "OK")
                    .then((value) {
                  _clearFields();
                })
              });
      //Alerta de registro exitoso

      // Realizar acción de envío
    } else {
      print('Formulario invalido');
    }
  }

  //final TextEditingController _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Registrarse"),
      //   backgroundColor: Color(0xFFF97F6F),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signUpForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ingrese sus datos para registrarse',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  CustomInput(
                      controller: _nameController,
                      label: "Nombre Completo",
                      validator: Validators.validateName),
                  const SizedBox(height: 16.0),
                  CustomInput(
                      controller: _usernameController,
                      label: "Nombre de usuario",
                      validator: Validators.validateUsername),
                  const SizedBox(height: 16.0),
                  CustomInput(
                      controller: _emailController,
                      label: "Correo Electronico",
                      validator: Validators.validateEmail),
                  const SizedBox(height: 16.0),
                  CustomInput(
                      controller: _passwordController,
                      label: "Contraseña",
                      validator: Validators.validatePassword,
                      isPassword: true),
                  const SizedBox(height: 24.0),
                  CostumButton(
                    callback: _signUpFunc,
                    text: "Registrarse",
                  ),
                  const SizedBox(height: 16.0),
                  CostumButton(
                      callback: () {
                        final route =
                            MaterialPageRoute(builder: (context) => Welcome());
                        Navigator.push(context, route);
                      },
                      text: "Regresar"),
                ],
              ),
            )),
      ),
    );
  }
}
