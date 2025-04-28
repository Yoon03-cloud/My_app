import 'package:flutter/material.dart';

/* simple button*/

class MyButton extends StatelessWidget{
  final String text;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding inside
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(

          //color of button 
            color: Theme.of(context).colorScheme.secondary,

            //curved corner
            borderRadius: BorderRadius.circular(12)
        ),

        // Text 
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight:FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
