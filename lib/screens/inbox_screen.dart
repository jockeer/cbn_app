import 'package:cbn/services/inboxService.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  final inboxservice = InboxService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              titulo: 'Inbox',
              logo: 'inbo.png',
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                future: inboxservice.obtenerCategoria(),
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              ListTile(
                                trailing: Icon(Icons.arrow_forward_ios),
                                // leading: Icon(Icons.person),
                                title: Text(
                                  snapshot.data[index]["categoria"],
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, 'chat',
                                      arguments: snapshot.data[index]);
                                },
                              ),
                              Divider()
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // Container(
            //   width: size.width * 0.92,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(50),
            //           bottomRight: Radius.circular(50)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 2,
            //           offset: Offset(0, 0), // changes position of shadow
            //         ),
            //       ]),
            //   margin: EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.only(left: 20),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Consulta General',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 22),
            //               ),
            //               Text(
            //                 '1 mensaje(s) nuevo(s)',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 12),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: size.width * 0.3,
            //         height: size.width * 0.3,
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   width: size.width * 0.92,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(50),
            //           bottomRight: Radius.circular(50)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 2,
            //           offset: Offset(0, 0), // changes position of shadow
            //         ),
            //       ]),
            //   margin: EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.only(left: 20),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Servicios Generales',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 22),
            //               ),
            //               Text(
            //                 '5 mensaje(s) nuevo(s)',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 12),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: size.width * 0.3,
            //         height: size.width * 0.3,
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   width: size.width * 0.92,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(50),
            //           bottomRight: Radius.circular(50)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 2,
            //           offset: Offset(0, 0), // changes position of shadow
            //         ),
            //       ]),
            //   margin: EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.only(left: 20),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Payroll',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 22),
            //               ),
            //               Text(
            //                 '2 mensaje(s) nuevo(s)',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 12),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: size.width * 0.3,
            //         height: size.width * 0.3,
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   width: size.width * 0.92,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(50),
            //           bottomRight: Radius.circular(50)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 2,
            //           offset: Offset(0, 0), // changes position of shadow
            //         ),
            //       ]),
            //   margin: EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Padding(
            //           padding: EdgeInsets.only(left: 20),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'CBN Contigo',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 22),
            //               ),
            //               Text(
            //                 '5 mensaje(s) nuevo(s)',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 12),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: size.width * 0.3,
            //         height: size.width * 0.3,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
