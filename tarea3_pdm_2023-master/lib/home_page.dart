import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  // lista con la lista de 10 actividades
  final List<Map<String, String>> _activities = [
    {
      "imagen": "https://i.imgur.com/FrnTp4U.png",
      "titulo": "Templo de Tanah Lot"
    },
    {
      "imagen": "https://i.imgur.com/gquqrgi.png",
      "titulo": "Bosque de los monos"
    },
    {
      "imagen": "https://i.imgur.com/obs0eQe.png",
      "titulo": "Playa Nyang Nyang"
    },
    {
      "imagen": "https://i.imgur.com/cYlaUlD.jpg",
      "titulo": "Arrozales TEGALLALANG"
    },
    {
      "imagen": "https://i.imgur.com/o8ZNfcK.jpg",
      "titulo": "Templo de Uluwatu"
    },
    {
      "imagen": "https://i.imgur.com/Yk7IKJL.png",
      "titulo": "Cascadas de Sekumpul"
    },
    {
      "imagen": "https://i.imgur.com/ytnWizA.png",
      "titulo": "Templo ULUN DANU BRATAN"
    },
    {"imagen": "https://i.imgur.com/o8ZNfcK.jpg", "titulo": "Monte Batur"},
    {"imagen": "https://i.imgur.com/igsdk8r.jpg", "titulo": "Tirta Empul"},
    {"imagen": "https://i.imgur.com/v3exwQq.png", "titulo": "Islas Nusa"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                // imagen con esquinas redondeadas
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://i.imgur.com/7CZquOU.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _activities.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            imagen: _activities[index]["imagen"]!,
                            dia: index + 1,
                            titulo: _activities[index]["titulo"]!,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        //mostrar snackbar
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Reservación en progreso..."),
                            ),
                          );
                      },
                      child: Text("Start booking",
                          style: TextStyle(color: Colors.grey[200])),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
