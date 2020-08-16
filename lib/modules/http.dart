import 'dart:convert';
// ignore: unused_import
import 'dart:io';
import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.168.43.184:3000";

// ignore: non_constant_identifier_names
Future<RequestResult> http_get(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  print("l");
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  print("l");
  var result = await http.get(url);
  print("l");
  
  return RequestResult(true, jsonDecode(result.body));

}
// ignore: non_constant_identifier_names
Future<RequestResult> http_post(String route, [dynamic data]) async
{


  var url = "$PROTOCOL://$DOMAIN/$route";
  print(data.runtimeType);
  var dataStr = jsonEncode(data);
   print(dataStr.runtimeType);
//  var test = jsonDecode(data);
//  print(test);
  print(dataStr);


  var result = await http.post(url,body:dataStr,headers: {"Content-Type":"application/json"});
    print("hi");
  return RequestResult(true, jsonDecode(result.body));
}