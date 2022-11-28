import 'package:flutter/material.dart';

class DateTextField extends StatelessWidget
{
  late final String? labelText;
  late final TextEditingController? textEditingController;
  late final dynamic Function()? onTap;

  DateTextField({@required this.labelText, @required this.onTap,@required this.textEditingController});
  @override
  Widget build(BuildContext context) {
   return     TextFormField(
       controller: this.textEditingController, //editing controller of this TextField
       decoration: InputDecoration(
         labelText: labelText,
         isDense: true,
         contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
         fillColor: Colors.white,
         filled: true,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(30),
         ),

         icon: Icon(Icons.calendar_today), //icon of text field
         // labelText: "Enter Date",
         //label text of field
       ),
       readOnly: true,  // when true user cannot edit text
       onTap: onTap
   );
  }

}