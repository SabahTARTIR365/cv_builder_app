import 'package:cv_builder_app/data/app_constants.dart';
import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:cv_builder_app/views/screens/extras_screen.dart';
import 'package:cv_builder_app/views/widgets/date_text_field.dart';
import 'package:cv_builder_app/views/widgets/editable_text_widget.dart';
import 'package:cv_builder_app/views/widgets/rounded_text_field.dart';
import 'package:cv_builder_app/views/widgets/next_button.dart';
import 'package:cv_builder_app/views/widgets/text_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget
{


  const SummaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGray,
      appBar:AppBar(
        title: const Text('Create Resume',textAlign: TextAlign.left,),
        backgroundColor: appBlue,
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: Icon(Icons.arrow_back,),
        ),

      ),
      body:  Consumer<CvProvider>(builder: (context, provider, x) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              decoration: BoxDecoration
                (
                border: Border.all
                  (
                  color: appGray,
                ),
                borderRadius: const BorderRadius.only
                  (
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: appDarkGray,
                    blurRadius: 4,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 30,),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min ,
                  children: [
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: appDarkGray),
                        Icon(Icons.done_outline, size: 10, color: appGreen,)
                      ],
                    ),
                    Text('Info', style: TextStyle(color: appDarkGray),),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Ionicons.briefcase_sharp, color: appDarkGray),
                        Icon(Icons.done_outline, size: 10, color: appGreen,)
                      ],
                    ),
                    Text('Work', style: TextStyle(color: appDarkGray),),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, color: appDarkGray),
                        Icon(Icons.done_outline, size: 10, color: appGreen,)
                      ],
                    ),
                    Text('Education', style: TextStyle(color:appDarkGray),),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Ionicons.person_circle_sharp, color: appDarkGray),
                        Icon(Icons.done_outline, size: 10, color: appGreen,)
                      ],
                    ),
                    Text('Skills', style: TextStyle(color: appDarkGray),),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.summarize, color: appGreen),
                        Icon(Icons.done_outline, size: 10, color: appGreen,)
                      ],
                    ),
                    Text('Summary', style: TextStyle(color: appGreen),),
                    const SizedBox(height: 25,),
                    Icon(Icons.library_add_sharp, color: appDarkGray),
                    Text('Extras', style: TextStyle(color: appDarkGray),),
                    const SizedBox(height: 25,),

                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.70,
              margin: EdgeInsets.only(top: 30, left: MediaQuery
                  .of(context)
                  .size
                  .width * 0.05),
              // color: Colors.red,
              child: SingleChildScrollView(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Summary', style:
                    TextStyle(fontSize: 16,
                        color: appBlue,
                        fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    const Text(
                      'This appears near the top of your resume. Impress employers with a strong opening '
                          'statement that sums up your strengths and experience. '
                      , style: TextStyle(fontSize: 14, color: appBlue),),
                    const SizedBox(height: 15,),

                    const SizedBox(height: 10,),
                    EditableTextWidget(controller: provider.summaryController,),// here some fixes
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NextButton(text: 'Next:Extras', onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                            return ExtrasScreen();
                          }));


                        },),
                      ],
                    ),
                  ],
                ),),
            ),
          ],);
      }
      ),
    );
  }

}