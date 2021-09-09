import 'package:cbn/services/cuponesService.dart';
import 'package:cbn/services/tiendaService.dart';
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
            child: Text('ss'),
            // child: GridView.count(
            //       crossAxisSpacing: 8,
            //       mainAxisSpacing: 20,
            //       childAspectRatio: 0.7,
            //       crossAxisCount: 3,
            //       children: [
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //         _Item(titulo: 'Agua Vital 350ml', img: 's', descuento: '30',color: Colors.green,),
            //       ],
            //     ),
          )
        ],
      )
    );
  }
}

class _Categorias extends StatelessWidget {

  final cuponesService = CuponesService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: cuponesService.obtenerCuponesCat(),
        builder: ( _, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            final List<dynamic> list = snapshot.data["categorias"];
            list.forEach((element) { });
            return ListView(
              
              children: list.map((categoria){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(categoria,style: TextStyle( fontWeight: FontWeight.bold ),),
                    Divider(thickness: 2, color: Colors.black,),
                    _Carousel(lista: snapshot.data["data"][categoria],),
                  ],
                );
              }).toList(),
              
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class _Carousel extends StatelessWidget {

  final List<dynamic> lista;

  _Carousel({ required this.lista });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width*0.5,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: PageController(
          viewportFraction: 0.33,
          initialPage: 1
        ),
        children: this.lista.map((cupon){
          return _Item(cupon: cupon , color: Colors.black);
          // return _Item(titulo: cupon["nombre"], img: cupon["foto"], descuento: cupon["descuento"].toString(), color: Colors.black);
        }).toList(),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final dynamic cupon;
  final Color color;
  final constantes = DatosConstantes();

  _Item({ required this.cupon, required this.color });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'cupon_select', arguments: this.cupon);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          // image: DecorationImage(image: NetworkImage('${constantes.dominio}/uploads/fotoCupon/$img')),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            Container(width: size.width*0.3,height: size.width*0.22, child: Image(image: NetworkImage('${constantes.dominio}/uploads/fotoCupon/${this.cupon["foto"]}'),)),
            Expanded(child: Container()),
            Text(this.cupon["nombre"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.grey[700]),textAlign: TextAlign.center,),
            SizedBox(height: 5,),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: this.color,
              ),
              child: Text('${this.cupon["descuento"]}% de descuento', style: TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.bold ),),
            )
          ],
        ),
      ),
    );
  }
}

class _Tiendas extends StatelessWidget {
  final tiendaService = TiendaService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: tiendaService.cargarTiendas(),
        builder: ( _ , AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8
              ),
              itemCount: snapshot.data.length,
              itemBuilder: ( BuildContext context , int index ){
                return _Tienda(titulo: snapshot.data[index]["name"], cupones: snapshot.data[index]["cupones"].toString(), logo: snapshot.data[index]["logo"],);
              },
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ) 
    );
  }
}

class _Tienda extends StatelessWidget {

  final String titulo, cupones, logo;
  final constantes = DatosConstantes();

  _Tienda({ required this.titulo, required this.cupones, required this.logo });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('${constantes.dominio}/uploads/logoTienda/$logo')),
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
