import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tap1 = false, tap2 = false, tap3 = false, tap4 = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // list title para icono, titulo y subtitulo
                          children: [
                            const Icon(
                              Icons.account_circle,
                              size: 54,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Flutter McFlutter',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  'Experienced App Developer',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Text("123 Main Street")),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Text("(415) 555-0198"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // 4 botones de ícono
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 28,
                                  icon: const Icon(Icons.accessibility),
                                  color: tap1 ? Colors.indigo : Colors.black,
                                  onPressed: () {
                                    tap1 = !tap1;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 28,
                                  icon: const Icon(Icons.timer),
                                  color: tap2 ? Colors.indigo : Colors.black,
                                  onPressed: () {
                                    tap2 = !tap2;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 28,
                                  icon: const Icon(Icons.phone_android),
                                  color: tap3 ? Colors.indigo : Colors.black,
                                  onPressed: () {
                                    tap3 = !tap3;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 28,
                                  icon: const Icon(Icons.phone_iphone),
                                  color: tap4 ? Colors.indigo : Colors.black,
                                  onPressed: () {
                                    tap4 = !tap4;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
