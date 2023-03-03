import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/tip_time_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                //outlined textfield
                controller: context.read<TipTimeProvider>().costController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Cost of service",
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
            // insertar 3 radio buttons
          ),
          Column(
            children: context
                .read<TipTimeProvider>()
                .radioGroupValues
                .entries
                .map(
                  (e) => RadioListTile(
                    value: e.key, // saca la key del map (key : value)
                    groupValue: context
                        .watch<TipTimeProvider>()
                        .selectedRadio, // el seleccionado por default
                    title: Text(e.value), // saca el texto del map (key : value)
                    onChanged: (newValue) // observa el nuevo valor seleccionado
                        {
                      //cambiar estado de los radios
                      context
                          .read<TipTimeProvider>()
                          .setSelectedRadio(newValue!);
                    },
                  ),
                )
                .toList(),
          ),
          SwitchListTile(
              secondary: Icon(Icons.credit_card),
              title: Text("Round up tip"),
              value: context.watch<TipTimeProvider>().isSelected,
              onChanged: (newValue) {
                // cambiar estado del switch
                context.read<TipTimeProvider>().setIsSelected(newValue);
              }),
          // botón con fondo verde y texto blanco
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              child: Text("CALCULATE", style: TextStyle(color: Colors.white)),
              onPressed: () {
                context.read<TipTimeProvider>().tipCalculation();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // alinear a la derecha el texto
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "Tip amount: \$${context.watch<TipTimeProvider>().tipAmount.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
