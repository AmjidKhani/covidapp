import 'package:covidapp/View/shimmeraffect.dart';
import 'package:covidapp/View/viewspecificcountryinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../logicmethode/fetchingdatafromapi.dart';

class countries extends StatefulWidget {
  const countries({Key? key}) : super(key: key);

  @override
  State<countries> createState() => _countriesState();
}

class _countriesState extends State<countries> {
  TextEditingController _searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (v) {
            setState(() {});
          },
          controller: _searchC,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Search With Country Name'),
        ),
      ),
      FutureBuilder(
          future: apimethodes().fetchcountriesdata(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return shimmeraffect();
            }

            if (!snapshot.hasData) {
              return shimmeraffect();
            }
            return SizedBox(
              height: 700,
              width: 400,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name = snapshot.data![index]['country'];
                    if (_searchC.text.isEmpty) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>showspecificcountry(
                            todayDeaths: snapshot.data![index]['todayDeaths'],
                            cases: snapshot.data![index]['cases'],
                            todayCases: snapshot.data![index]['todayCases'],
                            active: snapshot.data![index]['active'],
                            updated:snapshot.data![index]['updated'],
                            deaths: snapshot.data![index]['deaths'],
                            critical:snapshot.data![index]['critical'],
                            tests: snapshot.data![index]['tests'],

                            recovered: snapshot.data![index]['recovered'],
                            country: snapshot.data![index]['country'],
                            image:snapshot.data![index]['countryInfo']['flag'],
                          )));
                        },
                        child: ListTile(
                            title:
                                Text(snapshot.data![index]['country'].toString()),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                            leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']))),
                      );
                    } else if (name
                        .toLowerCase()
                        .contains(_searchC.text.toString().toLowerCase())) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>showspecificcountry(
                            todayDeaths: snapshot.data![index]['todayDeaths'],
                            cases: snapshot.data![index]['cases'],
                            todayCases: snapshot.data![index]['todayCases'],
                            active: snapshot.data![index]['active'],
                            updated:snapshot.data![index]['updated'],
                            deaths: snapshot.data![index]['deaths'],
                            critical:snapshot.data![index]['critical'],
                            tests: snapshot.data![index]['tests'],

                            recovered: snapshot.data![index]['recovered'],
                            country: snapshot.data![index]['country'],
                            image: snapshot.data![index]['countryInfo']['flag'],



                          )));
                        },
                        child: ListTile(
                            title:
                                Text(snapshot.data![index]['country'].toString()),
                            subtitle:
                                Text(snapshot.data![index]['cases'].toString()),
                            leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']))),
                      );
                    } else {
                      return Container();
                    }
                  }),
            );
          })
    ]));
  }
}
