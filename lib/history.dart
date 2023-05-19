import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:your_app/database.dart';

import 'purchase_tracker.dart';

class HistoryPage extends StatelessWidget {
  final PurchaseTracker purchaseTracker;

  const HistoryPage({super.key, required this.purchaseTracker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase History'),
      ),
      body: ListView.builder(
        itemCount: purchaseTracker.purchaseTimestamps.length,
        itemBuilder: (context, index) {
          final purchaseTimestamp = purchaseTracker.purchaseTimestamps[index];
          return ListTile(
            title: Text('Purchase ${index + 1}'),
            subtitle: Text('Date: ${purchaseTimestamp.toString()}'),
          );
        },
      ),
    );
  }
}

get purchaseTracker => HistoryPage;

@override
Widget build(BuildContext context) {
  // Implement your history page UI here
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HistoryPage(purchaseTracker: purchaseTracker),
    ),
  );

  return Container();
}
