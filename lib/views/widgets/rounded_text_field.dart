import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedTextField extends StatelessWidget {
  final String? labelText;
  final Function(String?)? onSaved;
  final  TextEditingController? controller;


   const RoundedTextField({@required this.labelText, @required this.onSaved, this.controller});

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

      validator: (value){
        if (value!.isEmpty||value==null)
          return 'This field is required' ;
        },
      onSaved: onSaved,
    );
  }
}



