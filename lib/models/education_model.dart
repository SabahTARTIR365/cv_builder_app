class EducationModel
{
  String? degree;
  String? schoolName;
  String? location;
  String? startDate;
  String? endDate;
  String? achievement;

  EducationModel({
    this.degree,
    this.schoolName,
    this.location,
    this.startDate,
    this.endDate,
    this.achievement
  });

  Map<String, dynamic> toMap() {
    return {
      'degree':degree,
      'schoolName': schoolName,
      'location':location,
      'startDate': startDate,
      'endDate':endDate,
      'achievement':achievement,
    };
  }




}