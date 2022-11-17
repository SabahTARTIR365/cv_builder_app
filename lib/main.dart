import 'dart:async';
import 'package:cv_builder_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:cv_builder_app/mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp( const MaterialApp(
    home:  SplashScreen(),
  ));
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ElevatedButton(onPressed: _createPdf,
        child: Text('Create pdf'),),)
    );
}

 Future <void>_createPdf ()async{
    PdfDocument document=  PdfDocument();
   final page= document.pages.add();//to add pages
    //to add text to the pdf
    page.graphics.drawString("Sabah Tartir CV welcome to my test", PdfStandardFont(PdfFontFamily.helvetica, 16));

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



