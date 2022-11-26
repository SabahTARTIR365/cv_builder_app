import 'package:cv_builder_app/data/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:cv_builder_app/data/app_constants.dart';
class NextButton extends StatelessWidget
{
  late String text;
  late VoidCallback onPressed;
  NextButton({Key? key, required this.text, required this.onPressed,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return
       RaisedButton(
         onPressed: onPressed,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
         padding: const EdgeInsets.all(0.0),
         child: Ink(
           decoration: const BoxDecoration(
             gradient: LinearGradient(
               colors: <Color>[appLightBlue,appBlue],
             ),
             borderRadius: BorderRadius.all(Radius.circular(80.0)),
           ),
           child: Container(
             constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
             alignment: Alignment.center,
             child: Text( text,
               textAlign: TextAlign.center,
               style: TextStyle(color: Colors.white),
             ),
           ),
         ),
       )


       ;
  }
  
}