import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter
{
  AppRouter._();
  static AppRouter appRouter=  AppRouter._();
  GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  showCustomDialoug(String title, String content)
  {
    showDialog(context:navigatorKey.currentContext!,
       builder: (context)
       {
        return AlertDialog(
         title: Text(title),
         content: Text(content),
         actions: [
          TextButton(onPressed: (){
            navigatorKey.currentState!.pop();
           }, child:Text('ok'))
        ],
      );
        });
  }

  goToWidgetAndReplace(Widget widget)
  {
    navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
        builder: (context){
      return widget;
    }));
  }
  goReplace(Widget widget)
  {
    navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (context){
          return widget;


        }));
  }


}






