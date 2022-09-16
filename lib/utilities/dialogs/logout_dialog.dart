import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) async {
  return await showGenericDialog<bool>(
    context: context,
    title: "Log Out",
    content: "Are you sure you wanna logout",
    optionBuilder: ()=>{
      'Cancel' : false,
      'Log out': true,
    },
  ).then((value) => value ?? false);
}
