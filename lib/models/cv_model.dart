import 'package:cv_builder_app/models/education_model.dart';
import 'package:cv_builder_app/models/info_model.dart';
import 'package:cv_builder_app/models/skill_model.dart';
import 'package:cv_builder_app/models/work_model.dart';

class CvModel
{
  final InfoModel infoModel;
  final  SkillModel skillModel;
  final WorkModel workModel;
  final  EducationModel educationModel;

  const  CvModel({
    required this.infoModel,
    required this.educationModel,
    required this.workModel,
    required this.skillModel,
  });



}