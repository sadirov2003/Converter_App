import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/bloc/keyboard_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/bloc/keyboard_event.dart';

import '../widgets/build_button_widget.dart';

class ConverterKeyboardScreen extends StatelessWidget {
  const ConverterKeyboardScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 72, 121, 116),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(context, 'C', 0.6, Colors.green),
                      buildButton(context, '7', 0.6, Colors.white),
                      buildButton(context, '8', 0.6, Colors.white),
                      buildButton(context, '9', 0.6, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(context, '↻', 0.6, Colors.lightBlueAccent),
                      buildButton(context, '4', 0.6, Colors.white),
                      buildButton(context, '5', 0.6, Colors.white),
                      buildButton(context, '6', 0.6, Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 108,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '+ −',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                '× ÷',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              buildButton(context, '1', 0.6, Colors.white),
                              const SizedBox(width: 8),
                              buildButton(context, '2', 0.6, Colors.white),
                              const SizedBox(width: 8),
                              buildButton(context, '3', 0.6, Colors.white),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //buildButton(context, 'C', 0.6, Colors.blue),
                              buildButton(context, '0', 0.6, Colors.white),
                              const SizedBox(width: 8),
                              buildButton(context, '.', 0.6, Colors.white),
                              const SizedBox(width: 8),
                              buildButton(context, '×', 0.6, Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
