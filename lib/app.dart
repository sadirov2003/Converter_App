import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/converter/bloc/converter_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/bloc/keyboard_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/view/converter_keyboard_screen.dart';

import 'converter/view/converter_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ConverterBloc(),
          ),
          BlocProvider(
            create: (_) => KeyboardBloc(),
          ),
          
        ],
        child: const ConverterPage(),
      ),
    );
  }
}