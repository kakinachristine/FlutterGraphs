import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts in Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter maps trial'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Monthly Covid-19 Infections'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          LineSeries<_Infections, String>(
            dataSource: <_Infections>[
              _Infections('Jan', 35000),
              _Infections('Feb', 28000),
              _Infections('Mar', 34000),
              _Infections('Apr', 32000),
              _Infections('May', 40000),
              _Infections('Jun', 60000),
              _Infections('Jul', 70000),
              _Infections('Aug', 80000),
              _Infections('Sep', 90000),
              _Infections('Oct', 100000),
              _Infections('Nov', 40000),
              _Infections('Dec', 20000),
            ],
            xValueMapper: (_Infections victims, _) => victims.year,
            yValueMapper: (_Infections victims, _) => victims.victims,
            // Enable data label
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}
