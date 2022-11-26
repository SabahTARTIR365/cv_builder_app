import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String? labelText;
  final Function(String?)? onSaved;

  AddressWidget({@required this.labelText, @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,//Normal textInputField will be displayed
      decoration: InputDecoration(
        alignLabelWithHint: true,
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 50),
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xff26D04A),
            width: 9,
          ),

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



