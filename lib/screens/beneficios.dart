import 'package:cbn/providers/login_provider.dart';
import 'package:cbn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CuponGiftcardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            titulo: 'Beneficios',
            logo: 'cbnInforma.png',
          ),
          _Menu()
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      padding: EdgeInsets.only(right: 20),
      children: [
        SizedBox(
          height: 20,
        ),
        _OptionMenu(
          titulo: 'Tiendas Afiliadas',
          ruta: 'tiendas_afiliadas',
          logo: 'tiendasafiliadas.png',
        ),
        SizedBox(
          height: 10,
        ),
        _OptionMenu(
          titulo: 'Cupones de descuentos',
          ruta: 'cupones',
          logo: 'cuponesdescuento.png',
        ),
        SizedBox(
          height: 10,
        ),
        _OptionMenu(
          titulo: 'Gift Card',
          ruta: 'tu_gift_card',
          logo: 'giftcard.png',
        ),
        SizedBox(
          height: 10,
        ),
        _OptionMenu(
          titulo: 'Beneficios internos',
          ruta: 'recarga_gift_card',
          logo: 'beneficiosInternos.png',
        ),
      ],
    )
        // child: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 15),
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       _MenuItem(
        //         titulo: 'Tiendas Afiliadas',
        //         ruta: 'tiendas_afiliadas',
        //         img: 'map.png',
        //         index: 7,
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       _MenuItem(
        //         titulo: 'Cupones de descuentos',
        //         ruta: 'cupones',
        //         img: 'cupon.png',
        //         index: 8,
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       _MenuItem(
        //         titulo: 'Tu Gift Card',
        //         ruta: 'tu_gift_card',
        //         img: 'gifcard.png',
        //         index: 9,
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       _MenuItem(
        //         titulo: 'Beneficios internos',
        //         ruta: 'recarga_gift_card',
        //         img: 'gift.png',
        //         index: 10,
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class _OptionMenu extends StatelessWidget {
  final String titulo, ruta, logo;

  _OptionMenu({required this.titulo, required this.ruta, required this.logo});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.25,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            this.titulo,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.055),
          ),
          Expanded(
            child: Container(),
          ),
          Image(
            image: AssetImage('assets/icons/$logo'),
            width: size.width * 0.15,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String titulo, ruta, img;
  final int index;

  _MenuItem(
      {required this.titulo,
      required this.ruta,
      required this.img,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        provider.index = this.index;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[500],
              image: DecorationImage(
                  image: AssetImage('assets/img/$img'), fit: BoxFit.cover)),
          alignment: Alignment.bottomLeft,
          width: double.infinity,
          height: size.height * 0.22,
          child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  this.titulo,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )),
        ),
      ),
    );
  }
}
