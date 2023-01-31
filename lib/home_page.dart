import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool tap = false, tap2 = false, tap3 = false, tap4 = false;

  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ListView(
        children: [
          Image.network(
              "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
          ListTile(
              title: Text("El ITESO, Universidad Jesuita de Guadalajara",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              subtitle: Text("San Pedro Tlaquepaque, Jal."),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: tap ? Colors.indigo : Colors.black54,
                    onPressed: () {
                      print("Liked $counter times");
                      counter++;
                      tap = !tap;
                      setState(() {});
                    },
                  ),
                  Text("$counter"),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(children: [
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                        color: tap2 ? Colors.indigo : Colors.black,
                        // show snackbar with text when pressed
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("Enviando correo...")));
                          // cambia de color el botón también
                          tap2 = !tap2;
                          setState(() {});
                        },
                        icon: Icon(Icons.mail),
                        iconSize: 55),
                    Text("Correo"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                        color: tap3 ? Colors.indigo : Colors.black,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("Llamando al ITESO...")));

                          tap3 = !tap3;
                          setState(() {});
                        },
                        icon: Icon(Icons.add_call),
                        iconSize: 55),
                    Text("Llamada"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                        color: tap4 ? Colors.indigo : Colors.black,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("En camino al ITESO...")));

                          tap4 = !tap4;
                          setState(() {});
                        },
                        icon: Icon(Icons.arrow_back),
                        iconSize: 55),
                    Text("Ruta"),
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. Fundada en el año de 1957 por el Padre Luis Hernández Prieto S.J.,3​ José Aguilar Figueroa y el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
          ),
        ],
      ),
    );
  }
}
