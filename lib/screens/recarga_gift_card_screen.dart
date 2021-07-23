import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecargaGiftCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Gift Card'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: DropdownButton(
                // underline: Container(
                //   height: 0.0,
                // ),
                isExpanded: true,
                value: '1',
                items: [
                  DropdownMenuItem(child: Text('Cerveceria Nacional'),value: '1',),
                  DropdownMenuItem(child: Text('Cerveceria Nacional'),value: '2',),
                  DropdownMenuItem(child: Text('Cerveceria Nacional'),value: '3',),
                ],
                onChanged: (opt){

                },
              ),
            ),
            SizedBox(height: 20,),
            Center(child: Image(image: AssetImage('assets/icons/gift.jpg'), width: 300,)),
            Text('Corte'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  height: 60,
                  child:  Text('Bs 10'),
                  color: Colors.red,
                ),
                SizedBox(width: 20,),
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  height: 60,
                  child:  Text('Bs 20'),
                  color: Colors.red,
                ),
                SizedBox(width: 20,),
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  height: 60,
                  child:  Text('Bs 30'),
                  color: Colors.red,
                ),
                SizedBox(width: 20,),
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  height: 60,
                  child:  Text('Bs 50'),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}