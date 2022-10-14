import 'dart:convert';
import 'dart:io';

import 'package:dinelah/models/ModelNotification.dart';
import 'package:dinelah/models/ModelProfileFields.dart';
import 'package:dinelah/models/ModelResponseCommon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/Helpers.dart';
import '../models/ModelLogIn.dart';
import '../models/ModelSingleProduct.dart';
import '../utils/ApiConstant.dart';

Future<ModelResponseCommon> getChangePassword(
    BuildContext context, oldPassword, newPassword) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogInData? user =
      ModelLogInData.fromJson(jsonDecode(pref.getString('user')!));
  var map = <String, dynamic>{};
  map['cookie'] = user.cookie;
  map['old_password'] = oldPassword;
  map['new_password'] = newPassword;
  print(':::::::::::' + user.cookie.toString());

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  // OverlayEntry loader = Helpers.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);

  http.Response response = await http.post(Uri.parse(ApiUrls.changePasswordUrl),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    //Helpers.hideLoader(loader);
    print("<<<<<<<getChangePassword from repository=======>" +
        response.body.toString());
    return ModelResponseCommon.fromJson(json.decode(response.body));
  } else {
    //Helpers.hideLoader(loader);
    // Helpers.createSnackBar(context, response.statusCode.toString());
    throw Exception(response.body);
  }
}
