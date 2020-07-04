import 'dart:convert';

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
  print("hi");
  var url = "$PROTOCOL://$DOMAIN/$route";

  var dataStr = jsonEncode(data);
  print(dataStr);
  var result = await http.post(url, body: dataStr, headers:{"Content-Type":"application/json"});
  print(result);
  return RequestResult(true, jsonDecode(result.body));
}