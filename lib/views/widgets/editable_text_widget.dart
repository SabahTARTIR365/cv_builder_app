import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:cv_builder_app/views/widgets/text_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:provider/provider.dart';
class EditableTextWidget extends StatelessWidget
{
// String description='start' ;
  final  TextEditingController controller;

  const EditableTextWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

return Consumer<CvProvider>(builder: (context, provider, x) {
  return
 Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children:[
    MarkdownTextInput(
          (String value){
           print(value);
            provider.setdescription(value);


            },//set state for this value
      controller.text,
      label: 'Description',
      maxLines: 10,
      actions: MarkdownType.values,
      controller: controller,
      validators: (value){
        if (value!.isEmpty||value==null)
          return 'This field is required' ;
      },
    ),
    TextButton(
      onPressed: () {
        controller.clear();
      },
      child: Text('Clear'),
    ),
    TextLabelWidget('Text Preview'),
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MarkdownBody(
        data: provider.description,
        shrinkWrap: true,
      ),
    ),
  ],
  );
  });
  }

}