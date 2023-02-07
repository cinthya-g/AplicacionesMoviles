import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  ItemActividad(
      {super.key,
      required this.imagen,
      required this.dia,
      required this.titulo});

  final String imagen;
  final int dia;
  final String titulo;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Image.network("$imagen", fit: BoxFit.fill),
          ),
          Text("Día $dia", style: TextStyle(fontSize: 11)),
          // ajustar texto al ancho de su container
          Container(
            width: 120,
            child: Text(
              "$titulo",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
