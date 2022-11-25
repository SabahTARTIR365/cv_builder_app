import 'package:flutter/material.dart';

class InputPrefab extends StatelessWidget {
  final String? labelText;
  final Function(String?)? onSaved;

  InputPrefab({@required this.labelText, @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),

        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: '',
      validator: (String? value) {
        return value == null ? '$labelText is required' : null;
      },
      onSaved: onSaved,
    );
  }
}



