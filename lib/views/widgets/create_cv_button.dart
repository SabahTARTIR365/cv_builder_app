import 'package:flutter/material.dart';

class CreateCvButton extends StatelessWidget
{
  const CreateCvButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Container(
  child: Column(

    children: [

          Container(
        margin:EdgeInsets.only( top:30,left:10),
        width:100,
        height: 150,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(5),

          color:   Color(0xffECECEC),),

          child: Padding(

          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
             Row(mainAxisAlignment:MainAxisAlignment.end,children: [Icon(Icons.highlight,color: Color(0xff26D04A),size: 20,)],),

              SizedBox(height: 20),

              FloatingActionButton.small(
                backgroundColor:  Color(0xff0F6ABC),
               child: Icon(Icons.add),

                  onPressed: (){}),



              SizedBox(height: 15),



              Row(mainAxisAlignment:MainAxisAlignment.center,



                children:



                    [ Expanded(child:



                      Text("Student or intermediate",

                      style: TextStyle(color:Color(0xff26D04A),fontSize:12),

                     textAlign: TextAlign.center,

                   ))],),

            //  SizedBox(height: 10),

            ],

          ),

        ),

      ),

          Container(

            margin:EdgeInsets.only(top:10) ,

            width:100,

            height:35,

          child:  Text('Create a Resume', textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),



          )

    ],

  ),
);
  }


}