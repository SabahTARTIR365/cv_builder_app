import 'package:cv_builder_app/data/app_constants.dart';
import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:cv_builder_app/views/screens/education_screen.dart';
import 'package:cv_builder_app/views/widgets/date_text_field.dart';
import 'package:cv_builder_app/views/widgets/editable_text_widget.dart';
import 'package:cv_builder_app/views/widgets/input_prefab.dart';
import 'package:cv_builder_app/views/widgets/next_button.dart';
import 'package:cv_builder_app/views/widgets/text_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class WorkScreen extends StatelessWidget
{


  const WorkScreen({Key? key}) : super(key: key);
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
                        Icon(Ionicons.briefcase_sharp, color: appGreen),
                        Icon(Icons.done_outline, size: 10, color: appGreen,)
                      ],
                    ),
                    Text('Work', style: TextStyle(color: appGreen),),
                    const SizedBox(height: 25,),
                    Icon(Icons.school, color: appDarkGray),
                    Text('Education', style: TextStyle(color: appDarkGray),),
                    const SizedBox(height: 25,),
                    Icon(Ionicons.person_circle_sharp, color: appDarkGray),
                    Text('Skills', style: TextStyle(color: appDarkGray),),
                    const SizedBox(height: 25,),
                    Icon(Icons.summarize, color: appDarkGray),
                    Text('Summary', style: TextStyle(color: appDarkGray),),
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

                    Text('Work Experience', style:
                    TextStyle(fontSize: 16,
                        color: appBlue,
                        fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    Text(
                      'Great! Lets fill out your work experience next', style:
                    TextStyle(fontSize: 14, color: appBlue),),
                    const SizedBox(height: 15,),
                    TextLabelWidget('Title/Position '),
                    const SizedBox(height: 10,),
                    RoundedTextField(
                      labelText: 'Software engineer', onSaved: (String) {},),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Company'),
                    const SizedBox(height: 10,),
                    RoundedTextField(labelText: 'e.g Apple', onSaved: (String) {},),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Location(City, State) '),
                    const SizedBox(height: 10,),
                    RoundedTextField(labelText: 'e.g. San Francisco, CA',
                      onSaved: (String) {},),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Start Date'),
                    const SizedBox(height: 10,),
                    // field
                    DateTextField(textEditingController: provider.workStartDateController,
                        labelText: 'Enter Date',  onTap: () async {
                      provider.createStartDatePicker(context);
                    }),
                    const SizedBox(height: 10,),
                    TextLabelWidget('End Date'),
                    const SizedBox(height: 10,),
                    DateTextField(textEditingController: provider.workEndDateController,
                        labelText: 'Enter End Date',  onTap: () async {
                          provider.createEndDatePicker(context);
                        }),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Functions and achievements'),
                    const SizedBox(height: 10,),
                    EditableTextWidget(),// here some fixes
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NextButton(text: 'Next:Edu', onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                            return EducationScreen();
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