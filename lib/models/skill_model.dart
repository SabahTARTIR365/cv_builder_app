class SkillModel
{
  String? title;
  SkillModel({this.title,});
  Map<String, dynamic> toMap() {
    return {
      'title':title,

    };
  }

}