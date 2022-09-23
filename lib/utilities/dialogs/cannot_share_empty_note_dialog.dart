import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) async {
  return showGenericDialog<void>(
    context: context,
    title: 'Sharing',
    content: "You can't share a empty note",
    optionBuilder: () => {
      'OK': null,
    },
  );
}
