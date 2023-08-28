//import 'dart:js_interop';
//import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller; //Controlador del input
  final String label; //Texto que se muestra en el input
  final Color? focusedBorderColor; //Color del borde cuando esta seleccionado
  final Color? fillColor;
  final bool? isPassword; //Color de fondo
  final Map<String, dynamic> Function(String)? validator;

  CustomInput(
      {Key? key,
      required this.controller,
      required this.label,
      this.focusedBorderColor,
      this.fillColor,
      this.isPassword,
      this.validator});
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator == null
          ? null
          : (value) {
              final Map<String, dynamic> validation =
                  widget.validator!(value.toString());
              //print(widget.controller.text.toString());
              print(
                  "La funcion de validacion tiene la entrada value?" + value!);
              print("La funcion de validacion tiene la salida Status?" +
                  validation['state'].toString());
              if (validation.containsKey('state') &&
                  validation['state'] == false) {
                return validation['msg'];
              }
              return null;
            },

      controller: widget.controller,
      obscureText: widget.isPassword == null ? false : widget.isPassword!,
      //onChanged: filterList,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.focusedBorderColor == null
            ? const Color(0xFFC0E9FF)
            : widget.fillColor, // Color de fondo
        labelText: widget.label,

        //prefixIcon: Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.focusedBorderColor == null
                  ? const Color(0xFFF97F6F)
                  : widget.focusedBorderColor!,
              width: 2.0),
          borderRadius: BorderRadius.circular(10.7),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.7),
        ),
      ),
    );
  }
}
