import 'package:cbn/providers/providers.dart';
import 'package:cbn/utils/constantes.dart';
import 'package:cbn/utils/validator.dart';
import 'package:cbn/widgets/snackbar.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecargaGiftCardScreen extends StatelessWidget {

  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final FocusScopeNode focus = FocusScope.of(context);
         if (!focus.hasPrimaryFocus && focus.hasFocus) return  FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: appBarWidget(titulo: 'Gift Card'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Opciones(),
                SizedBox(height: 20,),
                Center(child: Image(image: AssetImage('assets/icons/gift.jpg'), width: 300,)),
                SizedBox(height: 20,),
                Text('Corte', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                SizedBox(height: 20,),
                _Montos(),
                SizedBox(height: 20,),
                _BotonRecarga()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BotonRecarga extends StatelessWidget {

  final validator = FormValidator();
  final estilos = EstilosApp();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GiftCardProvider>(context);
    return Center(
      child: ElevatedButton(  
        child: estilos.buttonChild(texto: 'Comprar'),
        style: estilos.buttonStyle(oscuro: true),
        onPressed: (){
          if(provider.montoRecarga=='' || provider.montoRecarga=='0') return mostrarSnackBar(context, 'Escoga o indique un monto valido');
          if(!validator.isNumeric(provider.montoRecarga)) return mostrarSnackBar(context, 'El monto no es valido');

          Navigator.pushNamed(context, 'metodo_pago');
          
        },
      ),
    );
  }
}

class _Montos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<GiftCardProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Monto( montoRecarga: '10', ),
            SizedBox(width: 20,),
            _Monto( montoRecarga: '20', ),
            SizedBox(width: 20,),
            _Monto( montoRecarga: '30', ),
            SizedBox(width: 20,),
            _Monto( montoRecarga: '50', )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                color: (provider.montoRecarga == '10' || provider.montoRecarga == '20'||provider.montoRecarga == '30'||provider.montoRecarga == '50') ? Colors.white :Color(0xff002F5C)
              ),
              alignment: Alignment.center,
              width: 40,
              height: 55,
              child: Text('Bs', style: TextStyle(fontWeight: FontWeight.bold, color: (provider.montoRecarga == '10' || provider.montoRecarga == '20'||provider.montoRecarga == '30'||provider.montoRecarga == '50') ? Colors.black :Colors.white),),
            ),
            Container(
              width: size.width*0.25,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Form(
                child: TextFormField(
                  
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Otro monto',
                  ),
                  onChanged: (value){
                    provider.montoRecarga = value;
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _Opciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GiftCardProvider>(context);
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: DropdownButton(
        
          underline: Container(
            height: 0.0,
          ),

          isExpanded: true,
          value: provider.empresaRecarga,
          items: [
            DropdownMenuItem(child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Cerveceria Nacional'),
            ),value: '1',),
          ],
          onChanged: (opt){
            provider.empresaRecarga = opt.toString();
          },
        ),
    );
  }
}

class _Monto extends StatelessWidget {

  final String montoRecarga;

  _Monto({ required this.montoRecarga });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GiftCardProvider>(context);
    return GestureDetector(
      onTap: (){
        provider.montoRecarga = this.montoRecarga; 
      },
      child: Container(
        decoration: BoxDecoration(
          color: (provider.montoRecarga == this.montoRecarga)? Color(0xff002F5C) : Colors.white,
          border: Border.all(color: Color(0xff002F5C)),
          borderRadius: BorderRadius.circular(5)
        ),
        width: 60,
        alignment: Alignment.center,
        height: 55,
        child: Text('Bs'+this.montoRecarga, style: TextStyle(fontWeight: FontWeight.bold, color: (provider.montoRecarga == this.montoRecarga)? Colors.white : Colors.black),),
      ),
    );
  }
}