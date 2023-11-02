import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/bloc/keyboard_event.dart';

import '../bloc/keyboard_bloc.dart';

Widget buildButton(BuildContext context, String buttonText, double buttonHeight,Color buttonColor) {
  
  return Container(
    height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
    width: 83,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black12,
        side: const BorderSide(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        padding: EdgeInsets.all(0),
      ),
      onPressed: () {
        context.read<KeyboardBloc>().add(KeyboardEvent(buttonText: buttonText));
        //buttonPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: buttonColor,
        ),
      ),
    ),
  );
}
