import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reusrableRow extends StatelessWidget {
  String title;
  int? value;

  reusrableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 20.0, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              Text(value.toString(), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
