import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modelclass/Covidusermodel.dart';
import '../servicess.dart';

class apimethodes {

  Future<Covidusermodel?> fetchdata()async{

   var  response=await http.get(  Uri.parse(Servicesss.worldstateuri!));

    if (response.statusCode == 200) {
      var jsontomap=await jsonDecode(response.body);

      return Covidusermodel.fromJson(jsontomap);
    //  return jsontomap;
    }
    else{
      print("Erorr stattus code 200 not found");
    }


  }





  Future<List<dynamic>?> fetchcountriesdata()async{
var data;
    final response=await http.get(Uri.parse(Servicesss.countrieslist));

    if (response.statusCode==200) {
      var jsontomap=await jsonDecode(response.body);
       data=jsontomap;
      return data;
      //  return jsontomap;
    }
    else{
      print("Erorr stattus code 200 not found");
    }


  }


}