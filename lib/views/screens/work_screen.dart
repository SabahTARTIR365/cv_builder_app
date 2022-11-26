import 'package:cv_builder_app/data/app_constants.dart';
import 'package:cv_builder_app/views/widgets/address_widget.dart';
import 'package:cv_builder_app/views/widgets/input_prefab.dart';
import 'package:cv_builder_app/views/widgets/next_button.dart';
import 'package:cv_builder_app/views/widgets/text_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

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
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.2,
            decoration:  BoxDecoration
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
              color:   Colors.white,
              boxShadow: [
                BoxShadow(
                  color: appDarkGray,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            margin: EdgeInsets.only(top:10,),
            child:
            SingleChildScrollView(
              child: Column(
                children:[
                  const SizedBox(height: 25,),
                  Icon(Icons.person,color:appBlue ),
                  Text('Info',style: TextStyle(color: appDarkGray),),
                  const SizedBox(height: 25,),
                  Icon(Ionicons.briefcase_sharp,color:appDarkGray),
                  Text('Work',style: TextStyle(color: appDarkGray),),
                  const SizedBox(height: 25,),
                  Icon(Icons.school,color:appDarkGray),
                  Text('Education',style: TextStyle(color: appDarkGray),),
                  const SizedBox(height: 25,),
                  Icon(Ionicons.person_circle_sharp,color:appDarkGray),
                  Text('Skills',style: TextStyle(color: appDarkGray),),
                  const SizedBox(height: 25,),
                  Icon(Icons.summarize,color:appDarkGray),
                  Text('Summary',style: TextStyle(color: appDarkGray),),
                  const SizedBox(height: 25,),
                  Icon(Icons.library_add_sharp,color:appDarkGray),
                  Text('Extras',style: TextStyle(color: appDarkGray),),
                  const SizedBox(height: 25,),

                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.70,
            margin: EdgeInsets.only(top:70,left:MediaQuery.of(context).size.width*0.05),
            // color: Colors.red,
            child: SingleChildScrollView(
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Personal Information',style:
                  TextStyle(fontSize: 16,color:appBlue,fontWeight: FontWeight.bold),),
                  const  SizedBox(height: 5,),
                  Text('Lets get started with personal information' ,style:
                  TextStyle(fontSize: 14,color:appBlue),),
                  const  SizedBox(height: 15,),
                  TextLabelWidget('Full name '),
                  const  SizedBox(height: 10,),
                  InputPrefab(labelText: 'e.g Sabah Tartir',onSaved: (String ) {  },),
                  const  SizedBox(height: 10,),
                  TextLabelWidget('Profession '),
                  const  SizedBox(height: 10,),
                  InputPrefab(labelText: 'e.g Engineer',onSaved: (String ) {  },),
                  const  SizedBox(height: 10,),
                  TextLabelWidget('Phone No '),
                  const  SizedBox(height: 10,),
                  InputPrefab(labelText: '0569994444',onSaved: (String ) {  },),
                  const  SizedBox(height: 10,),
                  TextLabelWidget('Email'),
                  const  SizedBox(height: 10,),
                  InputPrefab(labelText: 'sabahtartir@gmail.com',onSaved: (String ) {  },),
                  const  SizedBox(height: 10,),
                  TextLabelWidget('Address'),
                  const  SizedBox(height: 10,),
                  AddressWidget(labelText: 'Tunes Street, Nablus, Palestine',onSaved: (String ) {  },),
                  const  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NextButton(text: 'Next:Work', onPressed: () {  }, ),
                    ],
                  ),
                ],
              ),),
          ),


        ],),
    );
  }

}