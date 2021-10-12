import 'package:flutter/material.dart';

class DatosConstantes{
  // String dominio = 'https://interna-cbn.herokuapp.com';
  String dominio = 'http://10.0.2.2:8085';
  // String dominio = 'http://192.168.0.4:8080';
}

class ColoresApp{
  Color botonClaro = Color(0xff87858A);
  Color plomo = Color(0xffB5B5B2);
  Color naranja = Color(0xffE2551D);
  Color naranjaClaro = Color(0xffFF530F);
}

class EstilosApp{

  ButtonStyle buttonStyle({ bool oscuro = false, bool largo = false }){
    return ElevatedButton.styleFrom(
        minimumSize: (largo) ?  Size(double.infinity, 0):null,
        primary: (oscuro)? Colors.black : ColoresApp().naranja,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        )
    );
  }

  Padding buttonChild({required String texto, double size = 18.0, double ph=20.0, double pv=10.0 }){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: ph,vertical: pv),
        child: Text(texto,style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),),
    );
  }

  InputDecoration inputDecoration({required String hintText, double padingTop = 0.0, bool circular = true}){
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: padingTop, horizontal: 15.0),
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular((circular)?50.0:0.0)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26),borderRadius: BorderRadius.circular((circular)?50.0:0.0)),
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