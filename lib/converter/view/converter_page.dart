


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/converter/bloc/converter_bloc.dart';
import 'package:flutter_exchange_rates_app/converter/view/converter_list.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            const Text(
              'Конверт Плюс',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: const ConverterList(),
    );
  }
}