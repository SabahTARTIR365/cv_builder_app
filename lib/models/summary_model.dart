class SummaryModel
{
  String? description;
  SummaryModel({this.description,});
  Map<String, dynamic> toMap() {
    return {
      'description':description,

    };
  }

}