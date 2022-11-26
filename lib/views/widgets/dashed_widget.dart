import 'package:cv_builder_app/app_router/app_router.dart';
import 'package:cv_builder_app/views/screens/build_cv_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
return     Container(
  color: Color(0xffEFF5FB),
  height: 150,
  width: 0.9*MediaQuery.of(context).size.width,
  margin:EdgeInsets.only(top: 10,left:20) ,
  child: DottedBorder(
    color: Color(0xff0F6ABC),
    strokeWidth: 1,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('You do not have any Resume or Cv',
              style: TextStyle(fontWeight:FontWeight.bold,
              fontSize:15,color: Color(0xff8E9294))),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),),
            onPressed: () { AppRouter.appRouter.goToWidgetAndReplace(BuildCvScreen());},
            child: const  Text('Create one now! ', style: TextStyle(fontWeight:FontWeight.bold,
                fontSize:15,color: Color(0xff26D04A))),
          ),
        ],
      ),
    ),
  ),
);
  }


}