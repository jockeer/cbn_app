import 'package:flutter/material.dart';

class TopLogoWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Image(
        image: AssetImage('assets/icons/logonegro.png'),
        width: size.width * 0.60,
      ),
    );
  }
}