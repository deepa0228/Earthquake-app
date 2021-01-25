import 'dart:convert';

import 'package:earthquake/flutter_maps/quakes_map_app/model/quake_model.dart';
import 'package:http/http.dart';

class Network{
  Future<Quakes> getAllQuakes() async{
    var apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";

    final response = await get(Uri.encodeFull(apiUrl));

    if(response.statusCode == 200){
      print("Quake data: ${response.body}");
      return Quakes.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error getting quakes");
    }
  }
}