import 'package:flutter/material.dart';

class CvTempleteWidget extends StatelessWidget
{
  late String imagePath='images/cv.png';

  CvTempleteWidget(String path, {Key? key,String ?name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(15),
      width:100,
      height: 160,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  Color(0xff26D04A),
      ),
      child: Padding(
        padding:EdgeInsets.only( right:0.5,left:0.5),
        child: Image.asset(imagePath,fit: BoxFit.cover,),
      ),
    );
  }

}