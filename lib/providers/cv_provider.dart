import 'package:cv_builder_app/data/db_helper.dart';
import 'package:cv_builder_app/models/info_model.dart';
import 'package:cv_builder_app/models/skill_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../mobile.dart';

class CvProvider extends ChangeNotifier
{
  //info
  InfoModel ?infoModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();

  GlobalKey<FormState>formKeyInfo= GlobalKey<FormState>();

  createPersonalInformation()
  async{
    infoModel=InfoModel(
      name:nameController.text,
      profession:professionController.text,
      phoneNo: phoneNoController.text,
      email: emailController.text,
      address: addressController.text,
      linkedinLink: linkedInController.text
    );
    await DbHelper.dbHelper.insertNewInfo(infoModel);
    print ('done for personal added to db');
    _createPdf();

  }
 //work
  TextEditingController titleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();
  TextEditingController workStartDateController = TextEditingController();
  TextEditingController workEndDateController = TextEditingController();
  TextEditingController workAchievementController = TextEditingController();

  //edu
  TextEditingController degreeController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController schoolLocationController = TextEditingController();
  TextEditingController textEditingControllerEducationStartDate = TextEditingController();
  TextEditingController textEditingControllerEducationEndDate = TextEditingController();
  TextEditingController schoolAchievementController = TextEditingController();
  //skill
  TextEditingController textEditingSkillController = TextEditingController();
  //summary
   TextEditingController summaryController = TextEditingController();
   //extras
  TextEditingController languagesController = TextEditingController();
  TextEditingController projectsController = TextEditingController();
  TextEditingController honorsController = TextEditingController();


  //importnt one need to check case-------------------------------------------------------------
  TextEditingController editableWidgetController = TextEditingController();
//pdf
  Future <void>_createPdf ()async{
    PdfDocument document=  PdfDocument();
    final page= document.pages.add();//to add pages
    //to add text to the pdf
    page.graphics.drawString(nameController.text, PdfStandardFont(PdfFontFamily.helvetica, 20),bounds: Rect.fromLTWH(10, 10, 500, 40));
    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,255), width: 1),
        Offset(10, 32),
        Offset(500, 32));

    page.graphics.drawString(professionController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 40, 500, 40));
    page.graphics.drawString(phoneNoController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 60, 500, 40));
    page.graphics.drawString(emailController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 80, 500, 40));
    page.graphics.drawString(addressController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 100, 500, 40));
    page.graphics.drawString(linkedInController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 120, 500, 40));

    //to add images to the pdf
    //page.graphics.drawImage(PdfBitmap(await  _readImageData('poster.png')), Rect.fromLTWH(0, 100, 440, 550));
    List<int>bytes=await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'output.pdf');
  }
  //pdf

  String description='start' ;
  List<SkillModel> allSkill = [];
  getAllSkills() {
    notifyListeners();
  }
  insertNewSkill() {
    SkillModel skillModel = SkillModel(title: textEditingSkillController.text);
    print('inside insert function sabah');
    print( skillModel .title);
    allSkill.add(skillModel);
    textEditingSkillController.clear();
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
      workStartDateController.text = formattedDate; //set foratted date to TextField value.
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
      workEndDateController.text = formattedDate; //set foratted date to TextField value.
    }
    else
    {
      print("Date is not selected");
    }
  }





  Widget _buildFullName()
  {return Text('mmm');}

}