import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/converter/bloc/converter_bloc.dart';
import 'package:flutter_exchange_rates_app/converter/bloc/converter_state.dart';
import 'package:flutter_exchange_rates_app/converter/widgets/container_currency_widget.dart';
import 'package:flutter_exchange_rates_app/keyboard/bloc/keyboard_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/view/converter_keyboard_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/converter_event.dart';

class ConverterList extends StatefulWidget {
  const ConverterList({super.key});

  @override
  State<ConverterList> createState() => _ConverterListState();
}

class _ConverterListState extends State<ConverterList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ConverterBloc>().add(ConverterFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConverterBloc, ConverterState>(
        builder: (context, state) {
      return BlocBuilder<KeyboardBloc, String>(builder: (context, keyState) {
        return Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                height: 60,
                color: const Color.fromARGB(255, 72, 121, 116),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://flagsapi.com/RU/flat/64.png',
                        fit: BoxFit.cover,
                        height: 38,
                        width: 50,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 45,
                      child: const Center(
                        child: Text(
                          'RUB',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(FontAwesomeIcons.arrowDown,
                        color: Colors.white, size: 20),
                    Container(
                      width: 235,
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            keyState,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ContainerCurrencyWidget(
                currency: 'TJS',
                urlFlagImage: 'https://flagsapi.com/TJ/flat/64.png',
                quantity: state.currency.isNotEmpty
                    ? (state.currency[0].tjs) * double.parse(keyState)
                    : 0,
              ),
              ContainerCurrencyWidget(
                currency: 'USD',
                urlFlagImage: 'https://flagsapi.com/US/flat/64.png',
                quantity: state.currency.isNotEmpty
                    ? (state.currency[0].usd) * double.parse(keyState)
                    : 0,
              ),
              ContainerCurrencyWidget(
                currency: 'AMD',
                urlFlagImage: 'https://flagsapi.com/AM/flat/64.png',
                quantity: state.currency.isNotEmpty
                    ? (state.currency[0].amd) * double.parse(keyState)
                    : 0,
              ),
              ContainerCurrencyWidget(
                currency: 'AZN',
                urlFlagImage: 'https://flagsapi.com/AZ/flat/64.png',
                quantity: state.currency.isNotEmpty
                    ? (state.currency[0].azn) * double.parse(keyState)
                    : 0,
              ),
              const SizedBox(height: 20),
              const ConverterKeyboardScreen(),
            ],
          ),
        );
      });
    });
  }
}
