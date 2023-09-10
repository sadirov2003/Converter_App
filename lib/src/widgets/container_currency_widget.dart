import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerCurrencyWidget extends StatelessWidget {
  final String currency;
  final String urlFlagImage;
  final double quantity;
  ContainerCurrencyWidget(
      {required this.currency,
      required this.urlFlagImage,
      required this.quantity});

  String toRoundDouble(double number) {
    return double.parse((number).toStringAsFixed(2)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        height: 60,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                urlFlagImage,
                fit: BoxFit.cover,
                height: 38,
                width: 50,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 45,
              child: Center(
                child: Text(
                  currency,
                  style: const TextStyle(
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
                    toRoundDouble(quantity),
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
    );
  }
}
