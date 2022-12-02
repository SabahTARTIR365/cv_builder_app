import 'dart:async';
import 'package:cv_builder_app/page2.dart';
import 'package:cv_builder_app/providers/cv_provider.dart';
import 'package:cv_builder_app/views/screens/build_cv_screen.dart';
import 'package:cv_builder_app/views/screens/education_screen.dart';
import 'package:cv_builder_app/views/screens/skills_screen.dart';
import 'package:cv_builder_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:cv_builder_app/mobile.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'data/db_helper.dart';
import 'views/screens/work_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp( InitApp()  /*const MaterialApp(home: MyApp(),//BuildCvScreen(),// )*/
  );
}


class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<CvProvider >(
        create: (context) {
          return CvProvider ();
        },
        child: const MyApp());
  }
}

//for the cv and creating pdf
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WorkScreen()//SplashScreen()////EducationScreen()SplashScreen()//////const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(onPressed: _createPdf,
        child: Text('Create pdf'),),)
    );
}

 Future <void>_createPdf ()async{
    PdfDocument document=  PdfDocument();
   final page= document.pages.add();//to add pages
    //to add text to the pdf
    page.graphics.drawString("Sabah Tartir CV welcome to my test", PdfStandardFont(PdfFontFamily.helvetica, 18));

    //to add images to the pdf
    page.graphics.drawImage(PdfBitmap(await  _readImageData('poster.png')), Rect.fromLTWH(0, 100, 440, 550));
   List<int>bytes=await document.save();
   document.dispose();
   saveAndLaunchFile(bytes, 'output.pdf');
 }


 Future<Uint8List>_readImageData(String name)async{

    final data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
 }



}



