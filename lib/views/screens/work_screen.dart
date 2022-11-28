import 'package:cv_builder_app/data/app_constants.dart';
import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:cv_builder_app/views/widgets/address_widget.dart';
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
              margin: EdgeInsets.only(top: 10,),
              child:
              SingleChildScrollView(
                child: Column(
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
                    InputPrefab(
                      labelText: 'Software engineer', onSaved: (String) {},),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Company'),
                    const SizedBox(height: 10,),
                    InputPrefab(labelText: 'e.g Apple', onSaved: (String) {},),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Location(City, State) '),
                    const SizedBox(height: 10,),
                    InputPrefab(labelText: 'e.g. San Francisco, CA',
                      onSaved: (String) {},),
                    const SizedBox(height: 10,),
                    TextLabelWidget('Start Date'),
                    const SizedBox(height: 10,),
                    // field
                    TextFormField(
                        controller: provider.textEditingController, //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today), //icon of text field
                            labelText: "Enter Date" //label text of field
                        ),
                        readOnly: true,  // when true user cannot edit text
                        onTap: () async {
                          //when click we have to show the datepicker
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );
                          if(pickedDate != null ){
                            print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need
                              provider.textEditingController.text = formattedDate; //set foratted date to TextField value.
                              }else{
                            print("Date is not selected");
                             }





                        }
                    ),
                    //
                    const SizedBox(height: 10,),
                    TextLabelWidget('End Date'),
                    const SizedBox(height: 10,),
                       // field
                    const SizedBox(height: 10,),
                    TextLabelWidget('Functions and achievements'),
                    const SizedBox(height: 10,),
                    // field

                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NextButton(text: 'Next:Work', onPressed: () {},),
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