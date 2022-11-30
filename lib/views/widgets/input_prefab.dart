import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedTextField extends StatelessWidget {
  final String? labelText;
  final Function(String?)? onSaved;
  final  TextEditingController? controller;


   RoundedTextField({@required this.labelText, @required this.onSaved, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:  controller,//Provider.of<CvProvider>(context).textEditingController,//for skill controller
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
      //initialValue: '',
      validator: (String? value) {
        return value == null ? '$labelText is required' : null;
      },
      onSaved: onSaved,
    );
  }
}



