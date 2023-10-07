import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Updated_app extends ChangeNotifier{
  dynamic ?data1,data2,data3,data4,data5,data6;
    Updated_app() {
    Stream.periodic(const Duration(minutes: 30)).
      listen((_) {
      Future<dynamic>.delayed(Duration(seconds: 1), (){
        return update();
        });
      }
      );
      }
   Future<dynamic> update()async{
    var data = await http.get(Uri.parse(
        "https://api.thingspeak.com/channels/875453/feeds.json?api_key=1DSQ7R1XTT1OK0Z1&results=1"));
    data1 = jsonDecode(data.body.toString());
    print(data1);
    print(data2= data1["channel"]["id"]);
    print(data3= data1["channel"]["name"]);
    print(data4= data1["channel"]["field1"]);
    print(data5= data1["channel"]["field2"]);
    print(data6= data1["channel"]["last_entry_id"]);
    notifyListeners();
    }
}

