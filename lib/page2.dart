import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Page2 extends StatelessWidget{
  @override
  Map<dynamic,String> data={};
  Widget build(BuildContext context) {
   // data=ModalRoute.of(context).settings.arguments as
    return Scaffold(
      appBar: AppBar(title: Text('Sabah Tartir'),),
      body: Center(
        child: ElevatedButton(onPressed: () {
        /*  Navigator.of(context).push(

            MaterialPageRoute(builder: (context){return Page1();}),
          );*/
          //Navigator.of(context).pop();
        }, child: Text('go tp age 1'),),
      ),
    );
  }

}