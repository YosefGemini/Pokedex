class Validators {
  static Map<String, dynamic> validateName(String text) {
    final RegExp patronNombre = RegExp(r"^[A-Za-z\s]+$");
    //print(" El valor de la validacion es " + patronNombre.hasMatch(text).toString());

    if (text.isEmpty) {
      return {"state": false, "msg": "Este campo es requerido"};
    }
    if (!patronNombre.hasMatch(text)) {
      return {"state": false, "msg": "El nombre solo puede contener letras"};
    }
    return {"state": true, "msg": "Nombre Valido"};
  }

  static Map<String, dynamic> validateUsername(String text) {
    final RegExp patronLongitud = RegExp(r'^.{8,25}$');

    final RegExp patronEspaciosBlanco = RegExp(r'^[^\s]+$');
    final RegExp patronCaracteresEspeciales = RegExp(r'^[a-zA-Z0-9._-]+$');
    final RegExp patronPrimeraLetraMinuscula = RegExp(r'^[a-z][\w.-]*$');

    if (text.isEmpty) {
      return {"state": false, "msg": "Este campo es requerido"};
    }
    if (!patronLongitud.hasMatch(text)) {
      return {"state": false, "msg": "Debe tener entre 8 y 25 caracteres"};
    }
    if (!patronEspaciosBlanco.hasMatch(text)) {
      return {"state": false, "msg": "No puede contener espacios en blanco"};
    }
    if (!patronCaracteresEspeciales.hasMatch(text)) {
      return {
        "state": false,
        "msg": "No puede contener caracteres especiales, solo . , _ , -"
      };
    }
    if (!patronPrimeraLetraMinuscula.hasMatch(text)) {
      return {"state": false, "msg": "Debe comenzar con una letra minuscula"};
    }
    return {"state": true, "msg": "Usuario Valido"};
  }

  static Map<String, dynamic> validateEmail(String text) {
    final RegExp patronLongitud = RegExp(r'^.{8,50}$');
    final RegExp patronEspaciosBlanco = RegExp(r'^[^\s]+$');
    final RegExp patronPrimeraLetraMinuscula = RegExp(r'^[a-z].*$');
    final RegExp patronCorreo =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (text.isEmpty) {
      return {"state": false, "msg": "Este campo es requerido"};
    }
    if (!patronCorreo.hasMatch(text)) {
      return {"state": false, "msg": "Correo invalido"};
    }
    if (!patronLongitud.hasMatch(text)) {
      return {
        "state": false,
        "msg": "El correo debe tener entre 8 y 25 caracteres"
      };
    }
    if (!patronEspaciosBlanco.hasMatch(text)) {
      return {
        "state": false,
        "msg": "El correo no puede contener espacios en blanco"
      };
    }
    if (!patronPrimeraLetraMinuscula.hasMatch(text)) {
      return {
        "state": false,
        "msg": "El correo debe comenzar con una letra minuscula"
      };
    }
    return {"state": true, "msg": "Correo Valido"};
  }

  static Map<String, dynamic> validatePassword(String text) {
    final RegExp patronLongitud = RegExp(r'^.{8,25}$');
    final RegExp patronEspaciosBlanco = RegExp(r'^[^\s]+$');
    final RegExp patronMayuscula = RegExp(r'^(?=.*[A-Z]).*$');
    final RegExp patronCaracterEspecial = RegExp(r'^(?=.*[@#$%^&+=]).*$');
    final RegExp patronNumero = RegExp(r'^(?=.*[0-9]).*$');

    if (text.isEmpty) {
      return {"state": false, "msg": "Este campo es requerido"};
    }
    if (!patronLongitud.hasMatch(text)) {
      return {
        "state": false,
        "msg": "La contraseña debe tener entre 8 y 25 caracteres"
      };
    }
    if (!patronEspaciosBlanco.hasMatch(text)) {
      return {
        "state": false,
        "msg": "La contraseña no puede contener espacios en blanco"
      };
    }
    if (!patronMayuscula.hasMatch(text)) {
      return {
        "state": false,
        "msg": "La contraseña debe contener al menos una letra mayuscula"
      };
    }
    if (!patronCaracterEspecial.hasMatch(text)) {
      return {
        "state": false,
        "msg": "La contraseña debe contener al menos un caracter especial"
      };
    }
    if (!patronNumero.hasMatch(text)) {
      return {
        "state": false,
        "msg": "La contraseña debe contener al menos un numero"
      };
    }

    return {"state": true, "msg": "Contraseña Valida"};
  }

  static Map<String, dynamic> validateNotNull(String text) {
    if (text.isEmpty) {
      return {"state": false, "msg": "Este campo es requerido"};
    }
    return {"state": true, "msg": "Campo Valido"};
  }
}
