import 'package:flutter/material.dart';

class DatosConstantes{

}

class ColoresApp{
  Color botonClaro = Color(0xff87858A);
  Color plomo = Color(0xffB5B5B2);
}

class EstilosApp{

  ButtonStyle buttonStyle({ bool oscuro = false }){
    return ElevatedButton.styleFrom(
        primary: (oscuro)? Colors.black : ColoresApp().botonClaro,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        )
    );
  }

  Padding buttonChild({required String texto}){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        child: Text(texto,style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
    );
  }

  InputDecoration inputDecoration({required String hintText, double padingTop = 0.0}){
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: padingTop, horizontal: 15.0),
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26),borderRadius: BorderRadius.circular(50.0)),
      filled:true,
      fillColor: Colors.white
    );
  }

  Padding inputLabel({required String label, bool obligatorio = false}){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0
      ), 
      child: Row(
        children: [
          Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
           Text((obligatorio)?' *':'',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red),),
        ],
      )
    );
  }
  
}