import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Modelclass/Covidusermodel.dart';
import '../logicmethode/fetchingdatafromapi.dart';
import '../reuablecomponent.dart';
import 'countries.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    apimethodes().fetchdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Covid Tracer App"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: apimethodes().fetchdata(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Covidusermodel?> snapshot) {
                    if (!snapshot.hasData) {
                      print(e.toString());
                      return Container(
                          margin: EdgeInsets.only(top: 310),
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50,
                            controller: _controller,
                          ),
                        );
                    }
                    else if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        margin: EdgeInsets.only(top: 310),
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _controller,
                        ),
                      );

                    }
                    else{

                    }
                    return Column(

                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          child: PieChart(

                            dataMap: {
                              "Total":
                              //200,
                              double.parse( snapshot.data!.cases.toString())  ,

                              "Recover":
                              //200,

                              double.parse(snapshot.data!.recovered.toString()),

                              "Death":
                              //200,
                              double.parse(snapshot.data!.deaths.toString()),
                            },
                            animationDuration: Duration(milliseconds: 1200),
                            chartValuesOptions:ChartValuesOptions(
                                showChartValuesInPercentage: true
                            ),
                            legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left),
                            chartType: ChartType.ring,
                            colorList: [Colors.green, Colors.blue, Colors.pink],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        reusrableRow(
                            title: 'Total', value: snapshot.data!.cases),
                        reusrableRow(
                            title: 'Recover', value: snapshot.data!.recovered),
                        reusrableRow(
                            title: 'Death', value: snapshot.data!.deaths),
                        reusrableRow(
                            title: 'Active', value: snapshot.data!.active),
                        reusrableRow(
                            title: 'Critical', value: snapshot.data!.critical),
                        reusrableRow(
                            title: 'Total Death', value: snapshot.data!.todayDeaths),
                        reusrableRow(
                            title: 'Update', value: snapshot.data!.updated
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>countries()));
                          },
                          child: Container(
                            height: 60,
                            width: 290,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "View Countries",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );


                  })
            ],
          ),
        ));
  }
}


