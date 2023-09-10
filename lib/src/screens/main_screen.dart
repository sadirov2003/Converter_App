import 'package:flutter/material.dart';
import 'package:flutter_exchange_rates_app/src/data/api/model/model.dart';
import 'package:flutter_exchange_rates_app/src/data/api/service/exchange_rates_service.dart';
import 'package:flutter_exchange_rates_app/src/widgets/container_currency_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Model> _list = [];
  final exhangeRateService = ExchangeRatesService();

  String money = '0';
  String quantityTJS = '0';
  String quantityUSD = '0';
  String quantityAMD = '0';
  String quantityAZN = '0';

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  getInfo() async {
    final info = await exhangeRateService.getSource();

    setState(() {
      _list.add(info);
    });
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        money = '0';
      } else if (buttonText == '×') {
        money = money.substring(0, money.length - 1);
        if (money == '') {
          money = '0';
        }
      } else {
        if (money == '0') {
          money = buttonText;
        } else {
          money = money + buttonText;
        }
      }
    });
  }

  Widget buildButton(BuildContext context, String buttonText,
      double buttonHeight, Color buttonColor) {
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
          buttonPressed(buttonText);
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
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(children: [
          const SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(12),
            height: 60,
            color: Color.fromARGB(255, 72, 121, 116),
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
                        money,
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
            quantity:
                _list.isNotEmpty ? (_list[0].tjs) * double.parse(money) : 0,
          ),
          ContainerCurrencyWidget(
            currency: 'USD',
            urlFlagImage: 'https://flagsapi.com/US/flat/64.png',
            quantity: _list.isNotEmpty ? (_list[0].usd) * double.parse(money) : 0,
          ),
          ContainerCurrencyWidget(
            currency: 'AMD',
            urlFlagImage: 'https://flagsapi.com/AM/flat/64.png',
            quantity: _list.isNotEmpty ? (_list[0].amd) * double.parse(money) : 0,
          ),
          ContainerCurrencyWidget(
            currency: 'AZN',
            urlFlagImage: 'https://flagsapi.com/AZ/flat/64.png',
            quantity: _list.isNotEmpty ? (_list[0].azn) * double.parse(money) : 0,
          ),
          const SizedBox(height: 20),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 72, 121, 116),
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
                          //color: Colors.black12,
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
                              children: const[
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
        ]),
      ),
    );
  }
}
