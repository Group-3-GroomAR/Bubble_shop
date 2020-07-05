import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.168.8.154:3000";

Future<RequestResult> http_get(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(url);
  return RequestResult(true, jsonDecode(result.body));
}
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

  return RequestResult(true, jsonDecode(result.body));
}