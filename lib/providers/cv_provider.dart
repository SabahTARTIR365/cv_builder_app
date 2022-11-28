import 'package:cv_builder_app/models/skill_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CvProvider extends ChangeNotifier
{
  TextEditingController textEditingControllerStartDate = TextEditingController();
  TextEditingController textEditingControllerEndDate = TextEditingController();
  TextEditingController editableWidgetController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();

  String description='start' ;
  List<SkillModel> allSkill = [];
  getAllSkills() {
    notifyListeners();
  }
  insertNewSkill() {
    SkillModel skillModel = SkillModel(title: textEditingController.text);
    allSkill.add(skillModel);
    textEditingController.clear();
    getAllSkills();
  }

  deleteSkill( SkillModel skillModel)
  {
    allSkill.remove(skillModel);
    getAllSkills();
  }

  setdescription(String value)
  {
    description=value;
    notifyListeners();
  }


  changePreviewWidget()
  {
    notifyListeners();
  }
  createStartDatePicker(BuildContext context)async
{
  //when click we have to show the datepicker
   DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101)
   );
    if(pickedDate != null )
    {
      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need
      textEditingControllerStartDate.text = formattedDate; //set foratted date to TextField value.
    }
    else
      {
    print("Date is not selected");
      }
}
  createEndDatePicker(BuildContext context)async
  {
    //when click we have to show the datepicker
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101)
    );
    if(pickedDate != null )
    {
      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need
      textEditingControllerEndDate.text = formattedDate; //set foratted date to TextField value.
    }
    else
    {
      print("Date is not selected");
    }
  }





  Widget _buildFullName()
  {return Text('mmm');}

}