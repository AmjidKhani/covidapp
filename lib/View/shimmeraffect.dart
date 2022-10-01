import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmeraffect extends StatelessWidget {
  const shimmeraffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: 700,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {

            return
              Shimmer.fromColors(
                  child: ListTile(
                    title: Container(
                      height:10 ,width:89 ,
                      color: Colors.white,
                    ),
                    subtitle:
                    Container(
                      height:10 ,width:89 ,
                      color: Colors.white,
                    ),
                    leading: Container(
                      height:50 ,width:50,
                      color: Colors.white,
                    ),
                  ),
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100);
          }),
    );}
  }

