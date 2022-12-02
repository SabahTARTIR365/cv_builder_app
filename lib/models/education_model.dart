class EducationModel
{
  String? title;
  String? company;
  String? location;
  String? startDate;
  String? endDate;
  String? achievement;

  EducationModel({
    this.title,
    this.company,
    this.location,
    this.startDate,
    this.endDate,
    this.achievement
  });

  Map<String, dynamic> toMap() {
    return {
      'title':title,
      'company': company,
      'location':location,
      'startDate': startDate,
      'endDate':endDate,
      'achievement':achievement,
    };
  }




}