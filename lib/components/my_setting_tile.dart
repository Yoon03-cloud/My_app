import 'package:flutter/material.dart';

/* 
Setting list tile 

This is a simple tile for each item in the settings page.
---------------------------------------------------

To Use this widget , need
-title(eg, "Dark Mode")
-action (e.g toogleTheme)*/
class MySettingTile extends StatelessWidget{
  final String title;
  final Widget action;

  const MySettingTile ({
    super.key,
    required this.title,
    required this.action,
  });

  //Build Ui
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //Continer
    return Container(
      decoration:BoxDecoration(

        //color
        color: Theme.of(context).colorScheme.secondary,

        //curve corners
        borderRadius: BorderRadius.circular(12),
      ) ,

      //padding outside
      margin:const EdgeInsets.only(left: 25, right : 25, top: 10),

      // padding inside
      padding: const EdgeInsets.all(25),
      // row
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //title
            Text(title, style:const TextStyle(fontWeight:FontWeight.bold),
            ),
            //action
            action,
          ]
      ),
    );
  }
}