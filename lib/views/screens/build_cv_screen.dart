import 'package:cv_builder_app/views/widgets/create_cv_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCvScreen extends StatelessWidget
{
  const BuildCvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Super Resume',textAlign: TextAlign.left,),backgroundColor: Color(0xff0F6ABC),
leading: Icon(Icons.menu),),

  body: Column(children: const [
    CreateCvButton(),



  ],),
);
  }

}