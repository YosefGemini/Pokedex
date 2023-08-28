import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class CostumAlert {
  static Future<void> showSimpleAlertWithCallback(
      context,
      ArtSweetAlertType type,
      String title,
      String message,
      String buttonText,
      Function callback) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.values[type.index],
        title: title,
        text: message,
        confirmButtonText: buttonText,
      ),
    );

    if (response.isTapConfirmButton) {
      print('se ha confirmado la accion');
      callback();
    }
    if (response.isTapCancelButton) {
      print("se a cancelado la accion");
      //callback();
    }
  }

  static Future<void> showSimpleAlert(context, ArtSweetAlertType type,
      String title, String message, String buttonText) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.values[type.index],
          title: title,
          text: message,
          confirmButtonText: buttonText,
          confirmButtonColor: Color(0xFFF97F6F)),
    );

    if (response.isTapConfirmButton) {
      print('se ha confirmado la accion');
      //callback();
    }
  }

  static Future<void> showConfirmationAlert(
    context,
    ArtSweetAlertType type,
    String title,
    String message,
    String buttonText,
    String cancelButtonText,
    Function callbackConfirm,
    Function callbackDeny,
  ) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.values[type.index],
          title: title,
          text: message,
          confirmButtonText: buttonText,
          confirmButtonColor: Color(0xFFF97F6F),
          cancelButtonText: cancelButtonText,
          cancelButtonColor: Color.fromARGB(255, 172, 85, 239),
          showCancelBtn: true),
    );

    if (response.isTapConfirmButton) {
      print('se ha confirmado la accion');
      callbackConfirm();
    }
    if (response.isTapCancelButton) {
      print("se a cancelado la accion");
      callbackDeny();
    }
  }
}
