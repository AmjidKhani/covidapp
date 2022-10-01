import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reuablecomponent.dart';

class showspecificcountry extends StatefulWidget {
  String? country, image;
  int? updated,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      active,
      critical,
      tests;

  showspecificcountry({
    required this.updated,
    required this.todayDeaths,
    required this.critical,
    required this.active,
    required this.cases,
    required this.recovered,
    required this.deaths,
    required this.image,
    required this.tests,
    required this.todayCases,
    required this.country,
  });

  @override
  State<showspecificcountry> createState() => _showspecificcountryState();
}

class _showspecificcountryState extends State<showspecificcountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 110.0,
              ),
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    //widget.cases!),
                    reusrableRow(title: 'Cases', value: widget.cases),
                    reusrableRow(title: 'Recoverd', value: widget.recovered),
                    reusrableRow(title: 'Death', value: widget.deaths),
                    reusrableRow(title: 'Active', value: widget.active),
                    reusrableRow(title: 'Critical', value: widget.critical),
                    reusrableRow(title: 'Tests', value: widget.tests),




                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(widget.image!),
            ),
          ],
        )
      ],
    ));
  }


}
