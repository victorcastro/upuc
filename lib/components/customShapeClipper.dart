import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);

    var fistEndpoint = Offset(size.width * .5, size.height - 30);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, fistEndpoint.dx, fistEndpoint.dy);

    var SecondEndpoint = Offset(size.width, size.height - 70);
    var SecondControlPoint = Offset(size.width * 0.75, size.height - 10);
    path.quadraticBezierTo(SecondControlPoint.dx, SecondControlPoint.dy, SecondEndpoint.dx, SecondEndpoint.dy);

    path.lineTo(size.width, size.height); 
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  
    @override 
    bool shouldReclip(CustomClipper oldClipper) => true;

}