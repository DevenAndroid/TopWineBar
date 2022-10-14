import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../models/ModelSingleOrder.dart';
import '../utils/ApiConstant.dart';

Future<ModelSingleOrderData> getSingleOrderData(orderId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogInData? user =
      ModelLogInData.fromJson(jsonDecode(pref.getString('user')!));
  var map = <String, dynamic>{};
  map['cookie'] = user.cookie;
  print('getSingleOrderData cookie' + user.cookie);
  map['order_id'] = orderId;

  print("getSingleOrderData map"+map.toString());
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  // OverlayEntry loader = Helpers.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);

  http.Response response = await http.post(Uri.parse(ApiUrls.getSingleOrderUrl),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    // Helpers.hideLoader(loader);
    print("<<<<<<<getSingleOrderData from repository=======>" +
        response.body.toString());
    return ModelSingleOrderData.fromJson(json.decode(response.body));
  } else {
    // Helpers.hideLoader(loader);
    // Helpers.createSnackBar(context, response.statusCode.toString());
    throw Exception(response.body);
  }
}
