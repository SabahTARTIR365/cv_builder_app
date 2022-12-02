import 'package:cv_builder_app/data/db_helper.dart';
import 'package:cv_builder_app/models/education_model.dart';
import 'package:cv_builder_app/models/info_model.dart';
import 'package:cv_builder_app/models/skill_model.dart';
import 'package:cv_builder_app/models/work_model.dart';
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
    //ADD IT TO FINISH BUTTON
   // _createPdf();

  }
 //work
  WorkModel ?workModel;
  TextEditingController titleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();
  TextEditingController workStartDateController = TextEditingController();
  TextEditingController workEndDateController = TextEditingController();
  TextEditingController workAchievementController = TextEditingController();
  GlobalKey<FormState>formKeyWork= GlobalKey<FormState>();

  createWorkModel()
  async{
 workModel=WorkModel(
   title: titleController.text,
   company: companyController.text,
   location: workLocationController.text,
   startDate: workStartDateController.text,
   endDate: workEndDateController.text,
   achievement: workAchievementController.text
 );
    await DbHelper.dbHelper.insertNewWork(workModel);
    print ('done for personal added to db');
    //createPdf();

  }

  //edu
  EducationModel? educationModel;
  TextEditingController degreeController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController schoolLocationController = TextEditingController();
  TextEditingController eduStartDateController = TextEditingController();
  TextEditingController eduEndDateController = TextEditingController();
  TextEditingController schoolAchievementController = TextEditingController();
  GlobalKey<FormState>formKeyEdu= GlobalKey<FormState>();
  createEduModel()
  {
    educationModel=EducationModel(
       degree: degreeController.text,
        schoolName: schoolNameController.text,
        location: schoolLocationController.text,
        startDate: eduStartDateController.text,
        endDate: eduEndDateController.text,
        achievement: schoolAchievementController.text
    );

    print ('done for edu to db');
  }


  //skill
  TextEditingController textEditingSkillController = TextEditingController();
  GlobalKey<FormState>formKeySkill= GlobalKey<FormState>();
  //summary
   TextEditingController summaryController = TextEditingController();
  GlobalKey<FormState>formKeySummary= GlobalKey<FormState>();
   //extras
  TextEditingController languagesController = TextEditingController();
  TextEditingController projectsController = TextEditingController();
  TextEditingController honorsController = TextEditingController();
  GlobalKey<FormState>formKeyExtra= GlobalKey<FormState>();


  //importnt one need to check case-------------------------------------------------------------
  TextEditingController editableWidgetController = TextEditingController();
//pdf
  Future <void> createPdf ()async{
    PdfDocument document=  PdfDocument();
    final page= document.pages.add();//to add pages
    //---------------------INFO PART-----------------------
    //to add text to the pdf
    page.graphics.drawString(nameController.text, PdfStandardFont(PdfFontFamily.helvetica, 27),bounds: Rect.fromLTWH(10, 5, 500, 40));
    page.graphics.drawLine(
        PdfPen(PdfColor(0,0,255), width: 1),
        Offset(10, 35),
        Offset(500, 35));
    page.graphics.drawString(professionController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 40, 500, 40));
    page.graphics.drawString(phoneNoController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 60, 500, 40));
    page.graphics.drawString(emailController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 80, 500, 40));
    page.graphics.drawString(addressController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 100, 500, 40));
    page.graphics.drawString(linkedInController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 120, 500, 40));
//----------------------------work part---------------------
    page.graphics.drawString("Experience", PdfStandardFont(PdfFontFamily.helvetica, 20),bounds: Rect.fromLTWH(10, 150, 500, 40));
    page.graphics.drawLine(PdfPen(PdfColor(0,0,255), width: 1), Offset(10, 175), Offset(500, 175));
    page.graphics.drawString(titleController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 200, 500, 40));
    page.graphics.drawString(companyController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 220, 500, 40));
    page.graphics.drawString(workLocationController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(100, 220, 500, 40));
    page.graphics.drawString(workStartDateController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 240, 500, 40));
    page.graphics.drawString(workEndDateController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(110, 240, 500, 40));
    page.graphics.drawString(workAchievementController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 260, 500, 40));
//----------------------------Edu part---------------------
    page.graphics.drawString("Education", PdfStandardFont(PdfFontFamily.helvetica, 20),bounds: Rect.fromLTWH(10, 300, 500, 40));
    page.graphics.drawLine(PdfPen(PdfColor(0,0,255), width: 1), Offset(10, 325), Offset(500, 325));

    page.graphics.drawString(degreeController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 350, 500, 40));
    page.graphics.drawString(schoolNameController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 370, 500, 40));
    page.graphics.drawString(schoolLocationController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(100, 370, 500, 40));
    page.graphics.drawString(eduStartDateController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 390, 500, 40));
    page.graphics.drawString(eduEndDateController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(110, 390, 500, 40));
    page.graphics.drawString( schoolAchievementController.text, PdfStandardFont(PdfFontFamily.helvetica, 16),bounds: Rect.fromLTWH(20, 410, 700, 80));


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
  createStartDatePicker(BuildContext context,TextEditingController controller)async
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
     controller.text = formattedDate; //set foratted date to TextField value.
    }
    else
      {
    print("Date is not selected");
      }
}
  createEndDatePicker(BuildContext context,TextEditingController controller)async
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
      controller.text = formattedDate; //set foratted date to TextField value.
    }
    else
    {
      print("Date is not selected");
    }
  }





  Widget _buildFullName()
  {return Text('mmm');}

}