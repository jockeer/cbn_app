import 'package:cbn/widgets/appbar.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [ 
              Header(titulo: 'Inbox', logo: 'inbo.png',),
              SizedBox(height: 20,),
              Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Consulta General', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22 ) ,),
                              Text('1 mensaje(s) nuevo(s)', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12 ) ,)
                            ],
                          ),
                        ),
                     
                    ),
                    Container(
                      color: Colors.grey,
                      width: size.width*0.3,
                      height: size.width*0.3,
                    )
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Servicios Generales', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22 ) ,),
                              Text('5 mensaje(s) nuevo(s)', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12 ) ,)
                            ],
                          ),
                        ),
                     
                    ),
                    Container(
                      color: Colors.grey,
                      width: size.width*0.3,
                      height: size.width*0.3,
                    )
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payroll', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22 ) ,),
                              Text('2 mensaje(s) nuevo(s)', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12 ) ,)
                            ],
                          ),
                        ),
                     
                    ),
                    Container(
                      color: Colors.grey,
                      width: size.width*0.3,
                      height: size.width*0.3,
                    )
                  ],
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CBN Contigo', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22 ) ,),
                              Text('5 mensaje(s) nuevo(s)', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12 ) ,)
                            ],
                          ),
                        ),
                     
                    ),
                    Container(
                      color: Colors.grey,
                      width: size.width*0.3,
                      height: size.width*0.3,
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}