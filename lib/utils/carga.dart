import 'package:flutter/material.dart';


loading({ required String titulo, required BuildContext context }){
   showDialog(context: context,barrierDismissible: false,  builder: (context){ return  AlertDialog(
      backgroundColor:Colors.transparent,
      elevation:0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          SizedBox(height: 20,),
          LinearProgressIndicator()
        ],
      ),
    );});
}