import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLabelWidget extends StatelessWidget
{
  late String title='';

  TextLabelWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Row(
  children:[
        Text(title ,style:
              TextStyle(fontSize: 16,color:Colors.black),),
       Icon(Icons.star,size: 8,color: Colors.redAccent,),
    ],
    );
  }

}