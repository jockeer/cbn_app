import 'package:cbn/utils/constantes.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CuponesScreen extends StatelessWidget {
  final estilos = EstilosApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(titulo: 'Cuponera de descuentos'),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              labelColor: Colors.black,
              indicatorColor: Color(0xff2C225C),
              indicatorWeight: 3,
              tabs: [
                Tab( child: Text('Tiendas',)),
                Tab( child: Text('Categorias',)),
                Tab( child: Text('Mi cuponera',)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _Tiendas(),
                  _Categorias(),
                  _MisCupones()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MisCupones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bebidas',style: TextStyle( fontWeight: FontWeight.bold ),),
          Divider(thickness: 2, color: Colors.black,),
          Expanded(
            child: GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                  crossAxisCount: 3,
                  children: [
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                    _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
                  ],
                ),
          )
        ],
      )
    );
  }
}

class _Categorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text('Bebidas',style: TextStyle( fontWeight: FontWeight.bold ),),
          Divider(thickness: 2, color: Colors.black,),
          _Carousel(),
          Text('Salud',style: TextStyle( fontWeight: FontWeight.bold ),),
          Divider(thickness: 2, color: Colors.black,),
          _Carousel(),
          Text('Snack',style: TextStyle( fontWeight: FontWeight.bold ),),
          Divider(thickness: 2, color: Colors.black,),
          _Carousel(),
        
        ],
      ),
    );
  }
}

class _Carousel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: PageController(
          viewportFraction: 0.35,
          initialPage: 1
        ),
        children: [
          _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30', color: Colors.black,),
          _Item(titulo: 'Gaseosa pepsi 1L', img: 's', descuento: '10', color: Colors.black,),
          _Item(titulo: 'Gaseosa Seven Up 2L', img: 's', descuento: '20', color: Colors.black,),
          _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '50', color: Colors.black,),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String titulo, img, descuento;
  final Color color;

  _Item({ required this.titulo,required this.img, required this.descuento, required this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(this.titulo,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.grey[700]),textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: this.color,
            ),
            child: Text('$descuento% de descuento', style: TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.bold ),),
          )
        ],
      ),
    );
  }
}

class _Tiendas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisSpacing: 8,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
        children: [
          _Tienda(titulo: 'Farmacorp',cupones: '15',), 
          _Tienda(titulo: 'Multicenter',cupones: '30',), 
          _Tienda(titulo: 'Amarket',cupones: '10',), 
          _Tienda(titulo: 'Fidalga',cupones: '20',), 
          _Tienda(titulo: 'Sudamericana',cupones: '10',), 
        ],
      )
    );
  }
}

class _Tienda extends StatelessWidget {

  final String titulo, cupones;

  _Tienda({ required this.titulo, required this.cupones });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(this.titulo,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.grey[700]),),
          SizedBox(height: 5,),
          Text('$cupones cupones disponibles',style: TextStyle(fontSize: 10, color: Colors.grey),),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
