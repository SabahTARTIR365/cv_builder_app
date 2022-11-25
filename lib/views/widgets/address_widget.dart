import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String? labelText;
  final Function(String?)? onSaved;

  AddressWidget({@required this.labelText, @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

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



