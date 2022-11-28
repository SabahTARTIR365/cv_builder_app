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
      provider.editableWidgetController.text,
      label: 'Description',
      maxLines: 10,
      actions: MarkdownType.values,
      controller: provider.editableWidgetController,
    ),
    TextButton(
      onPressed: () {
        provider.editableWidgetController.clear();
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