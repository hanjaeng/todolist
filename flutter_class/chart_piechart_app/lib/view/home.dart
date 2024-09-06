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
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: SizedBox(      //bar차트는 sizeBox에 있어야함
          width: 380,
          height:600,
          child: SfCircularChart(
            title: ChartTitle(
              text: "Yearly Growth in the Flutte Community"
            ),
            tooltipBehavior: tooltipBehavior,
            series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(    // < 타입지정!!!>
                name: 'Developers',
                dataSource: data,
                selectionBehavior: SelectionBehavior(enable: true), //pie차트나왔을때 뭔가 보여줄래?
                explode: true,  //클릭시 커지는거
                xValueMapper: (DeveloperData developers, _) => developers.year,   // _타입을 맞춰 위 2개 쓰겠지만 안쓰겠다!의미 
                yValueMapper: (DeveloperData developers, _) =>
                    developers.developers,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],   
          ),
        ),
      ),
    );
  }
}