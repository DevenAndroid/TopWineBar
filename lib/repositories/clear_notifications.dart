import 'dart:convert';
import 'dart:io';

import 'package:dinelah/helper/Helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/ApiConstant.dart';
import '../models/ModelLogIn.dart';
import '../models/ModelResponseCommon.dart';

Future<ModelResponseCommon> clearNotifications(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogInData? user =
      ModelLogInData.fromJson(jsonDecode(pref.getString('user')!));

  var map = <String, dynamic>{};
  map['cookie'] = user.cookie;

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  http.Response response = await http.post(
      Uri.parse(ApiUrls.clearNotificationUrl),
      body: jsonEncode(map),
      headers: headers);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return ModelResponseCommon.fromJson(json.decode(response.body));
  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, response.statusCode.toString());
    throw Exception(response.body);
  }
}
