
/*import 'package:cv_builder_app/models/skill_model.dart';
import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillWidget extends StatelessWidget {
SkillModel skillModel
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: CheckboxListTile(
        secondary: IconButton(
            onPressed: () {
              Provider.of<CvProvider>(context, listen: false)
                  .deleteSkill();
            },
            icon: Icon(Icons.delete)),
        value: skillModel.isComplete,
        onChanged: (v) {
          Provider.of<CvProvider>(context, listen: false).updateTask(taskModel);
        },
        title: Text(taskModel.title ?? ''),
      ),
    );
  }
}
*/