class LanguageModel
{
  String? name;
  Level ?level;


  LanguageModel({this.name,this.level});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'level':level,
    };
  }

}
enum Level {
  elementary,
  intermediate,
  advanced,
  native
}