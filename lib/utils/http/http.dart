import 'dart:convert';

import 'package:http/http.dart' as  http;

class Thttphelper{
  static const String _baseurl = "https://fakestoreapi.com/products";


  //get method
 static Future<Map< String , dynamic>> get(String endpoint) async {
   final response = await http.get(Uri.parse("$_baseurl/$endpoint"));
   return _handleresponse(response);
  }


  //post method
  static Future<Map<String,dynamic>> post(String endpoint , dynamic data) async{
   final response = await http.post(Uri.parse("$_baseurl/$endpoint"),
   headers: {'Content-Type': 'application/json'},
     body: json.encode(data),
   );
   return _handleresponse(response);
  }

  //put method
  static Future<Map<String, dynamic>> put(String endpoint,dynamic data)async {
   final response = await http.put(Uri.parse('$_baseurl/$endpoint'),
   headers: {'content-Type': 'application/json'},
     body: json.encode(data),
   );
   return _handleresponse(response);
}

 // delete method
  static Future<Map<String , dynamic>> delete(String endpoint) async {
   final response = await http.delete(Uri.parse('$_baseurl/$endpoint'));
   return _handleresponse(response);
}

// handle the http response
  static Map<String ,dynamic> _handleresponse(http.Response response){
   if(response.statusCode== 200){
     return json.decode(response.body);
   }else {
     throw Exception("Failed to load data :${response.statusCode}");
   }
  }














}