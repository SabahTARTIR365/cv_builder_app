import 'package:cv_builder_app/views/widgets/create_cv_button.dart';
import 'package:cv_builder_app/views/widgets/cv_templete_widget.dart';
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

  body: Column(
   //mainAxisAlignment:MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
    CreateCvButton(),
     SizedBox(height: 10),
    Container(
        margin:EdgeInsets.only(left:10) ,
        child:
         const Text('Browse Templates',
             style: TextStyle(fontWeight:FontWeight.bold,
             fontSize:17,color: Color(0xff0F6ABC)))),

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CvTempleteWidget('images/cv-temp1.png'),
            CvTempleteWidget('images/cv-temp2.png'),
            CvTempleteWidget('images/cv-temp2.png'),
          ],),
      ),
      Container(
          margin:EdgeInsets.only(left:10) ,
          child:
          const Text('My Resume/CV',
              style: TextStyle(fontWeight:FontWeight.bold,
                  fontSize:17,color: Color(0xff0F6ABC)))),


  ],),
);
  }

}