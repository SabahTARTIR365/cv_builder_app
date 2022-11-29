
import 'package:cv_builder_app/data/app_constants.dart';
import 'package:cv_builder_app/models/skill_model.dart';
import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillWidget extends StatelessWidget {
late SkillModel skillModel;

  SkillWidget(this.skillModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      height: 50,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
         color:   Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: RaisedButton(
        color:   Colors.white,
        onPressed: () {Provider.of<CvProvider>(context, listen: false).deleteSkill(skillModel);},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(skillModel.title ?? 'test'),
            Icon(Icons.delete,)
          ],
        ),
      ),

       // title: Text(skillModel.title ?? 'test'),

    );
  }
}






