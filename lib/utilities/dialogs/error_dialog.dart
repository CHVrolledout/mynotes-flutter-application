import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) async {
  return await showGenericDialog(
    context: context,
    title: "an error occurred",
    content: text,
    optionBuilder: ()=>{
      'Ok' : null,
    },
  );
}
