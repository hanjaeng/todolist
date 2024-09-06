import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/developer_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior; //차트나오면 숫자보여주는거(팝업처럼)

  @override
  void initState() {
    super.initState();
    data = [];
    addData();
    tooltipBehavior = TooltipBehavior(enable: true);
  }
  addData(){
    data.add(DeveloperData(year: 2017, developers: 19000)); //requird쓰면 키값이 자동으로 보임
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

//----------- ^ 위는 처음 실행될때 build구성되기 이전 초기화면 --------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scatter Chart'),
      ),
      body: Center(
        child: SizedBox(      //bar차트는 sizeBox에 있어야함
          width: 380,
          height:600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: "Yearly Growth in the Flutte Community"
            ),
            tooltipBehavior: tooltipBehavior,
            series: [ScatterSeries<DeveloperData, int>(    // < chart 타입지정!!!> scatter는 추세
                color: Theme.of(context).colorScheme.primary,
                dataSource: data,
                xValueMapper: (DeveloperData developers, _) => developers.year,   // _타입을 맞춰 위 2개 쓰겠지만 안쓰겠다!의미 
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: const DataLabelSettings(isVisible: true), //차트위에 숫자 보이게!!
                enableTooltip:true, // 터치시 창으로 숫자보이게!!!
              )
            ],   
            // x축 타이틀(xlabel)
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'),
            ),
            // y축 타이틀(ylabel)
            primaryYAxis: CategoryAxis(
              title: AxisTitle(text: '인원수'),
            ),
          ),
        ),
        ),
    );
  }
}