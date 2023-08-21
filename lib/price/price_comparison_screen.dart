import 'package:auction_app/price/services/ebay_service.dart';
import 'package:auction_app/price/services/price_chart_service.dart';
import 'package:flutter/material.dart';

class PriceComparisonScreen extends StatefulWidget {
  const PriceComparisonScreen({Key? key}) : super(key: key);

  @override
  State<PriceComparisonScreen> createState() => _PriceComparisonScreenState();
}

class _PriceComparisonScreenState extends State<PriceComparisonScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              PriceChartService().getPriceChartConsole("famicom");
            },
            child: Text('Search'),
          )
        ],
      ),
    );
  }
}
