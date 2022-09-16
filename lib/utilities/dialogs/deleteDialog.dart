// ignore: file_names

import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> deleteDialog(BuildContext context) async {
  return await showGenericDialog(
    context: context,
    title: "Delete Note",
    content: "Are you sure you want to delete this note?",
    optionBuilder: ()=>{
      'Cancel' : false,
      "Delete" : true,
    },
  ).then((value) => value ?? false);
}
