import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:provider/provider.dart';

import 'auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ChartWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Welcome, ${user?.email ?? 'Guest'}!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/category');
            },
            child: const Text('Category Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
            child: const Text('History Page'),
          ),
        ],
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sampleData = [
      ChartData('Jan', 5),
      ChartData('Feb', 25),
      ChartData('Mar', 100),
      ChartData('Apr', 75),
    ];

    final seriesList = [
      charts.Series<ChartData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartData sales, _) => sales.month,
        measureFn: (ChartData sales, _) => sales.amount,
        data: sampleData,
      ),
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
    );
  }
}

class ChartData {
  final String month;
  final int amount;

  ChartData(this.month, this.amount);
}
